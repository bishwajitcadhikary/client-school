<script setup>
import {trans} from "laravel-vue-i18n"
import {inject, ref} from "vue"
import {useForm} from "@inertiajs/inertia-vue3"
import SettingsDrawerContent from '@/Pages/Admin/Settings/SettingsDrawerContent.vue'

const props = defineProps({
  gateways: {
    type: Object,
    default: null,
  },
})

const Notification = inject('Notification')
const dialog = ref(false)
const deletableLangId = ref(null)

const statusForm = useForm({
  statuses: [...props.gateways.data.map(i => !!i['is_active'])],
})

function updateGatewayStatus(key, id) {
  useForm({
    _method: 'PUT',
    is_active: statusForm.statuses[key],
  }).post(route('admin.settings.gateways.change-status', {gateway: id}), {

    onSuccess: page => {
      if (page.props.flash.success) {
        Notification.success(page.props.flash.success)
      }
      if (page.props.flash.error) {
        Notification.error(page.props.flash.error)
      }
      statusForm.statuses = page.props.gateways.data.map(i => !!i['is_active'])
    },
  })
}

function deleteGateway() {
  dialog.value = false
  useForm({})
    .delete(route('admin.settings.gateways.destroy', {gateway: deletableLangId.value}), {
      onSuccess: page => {
        if (page.props.flash.success) {
          Notification.success(page.props.flash.success)
        }
        if (page.props.flash.error) {
          Notification.error(page.props.flash.error)
        }
        statusForm.statuses = page.props.gateways.data.map(i => !!i['is_active'])
        defaultForm.statuses = page.props.gateways.data.map(i => !!i['is_default'])
      },
    })
}
</script>

<template>
  <AdminLayout
    :action="{href: route('admin.settings.gateways.create'), icon: 'mdi-plus', title: $t('Add New')}"
    :title="$t('Gateways')"
  >
    <template #sub-navbar>
      <SettingsDrawerContent />
    </template>

    <VContainer>
      <VCard>
        <VTable
          class="table-rounded"
        >
          <thead>
            <tr>
              <th width="5%">
                #
              </th>
              <th>{{ $t('Logo') }}</th>
              <th>{{ $t('Name') }}</th>
              <th>{{ $t('Namespace') }}</th>
              <th>{{ $t('Charge') }}</th>
              <th>{{ $t('Min Amount') }}</th>
              <th>{{ $t('Max Amount') }}</th>
              <th>{{ $t('Status') }}</th>
              <th />
            </tr>
          </thead>
          <tbody>
            <tr
              v-for="(gateway, key) in gateways.data"
              :key="key"
            >
              <td>{{ gateway.name }}</td>
              <td>{{ gateway.code }}</td>
              <td>
                <VSwitch
                  v-model="statusForm.statuses[key]"
                  color="primary"
                  hide-detail
                  @change="updateGatewayStatus(key, gateway.id)"
                />
              </td>

              <td
                class="pa-1"
                width="10%"
              >
                <VBtnToggle
                  rounded="xl"
                >
                  <VTooltip :text="$t('Edit Gateway')">
                    <template #activator="{ props }">
                      <VBtn
                        icon="mdi-clipboard-edit-outline"
                        v-bind="props"
                        @click="$inertia.visit(route('admin.settings.gateways.edit', {gateway: gateway.id}))"
                      />
                    </template>
                  </VTooltip>
                  <VTooltip :text="$t('Delete Gateway')">
                    <template #activator="{props}">
                      <VBtn
                        v-if="!gateway.is_default"
                        icon="mdi-delete-outline"
                        v-bind="props"
                        @click="dialog = true; deletableLangId = gateway.id"
                      />
                    </template>
                  </VTooltip>
                </VBtnToggle>
              </td>
            </tr>
          </tbody>
        </VTable>
      </VCard>
    </VContainer>
    <VDialog
      v-model="dialog"
      max-width="290"
    >
      <VCard class="pa-3">
        <VCardTitle class="text-h5 text-center">
          {{ $t('Are your sure to delete?') }}
        </VCardTitle>

        <VCardText class="text-center">
          <p>{{ $t('Action cannot be undone') }}</p>
        </VCardText>

        <VCardActions>
          <VSpacer />

          <VBtn
            @click="dialog = false"
          >
            {{ $t('Cancel') }}
          </VBtn>

          <VBtn
            color="error"
            @click.stop="deleteGateway"
          >
            {{ $t('Delete') }}
          </VBtn>
        </VCardActions>
      </VCard>
    </VDialog>
  </AdminLayout>
</template>
