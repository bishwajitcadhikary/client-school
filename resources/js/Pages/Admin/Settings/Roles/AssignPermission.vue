<script setup>
import {useForm} from "@inertiajs/inertia-vue3"
import {computed, ref} from "vue"
import SettingsDrawerContent from '@/Pages/Admin/Settings/SettingsDrawerContent.vue'
import {useSnackbarStore} from "@/Stores/useSnackbarStore"
const props = defineProps({
  role: {
    type: Object,
    required: true,
  },
  groups: {
    type: Array,
    default: null,
  },
  permissionIds: {
    type: Array,
    default: null,
  },
})
const snackbarStore = useSnackbarStore()
const form = useForm({
  permissions: [...props.permissionIds],
  name: null,
})

const select_all = ref(false)
const checkboxes = ref()

function selectAll() {
  checkboxes.value.forEach(check => {
    console.log(check.value)
  })
}

function submit() {
  form.put(route('admin.settings.roles.assign-permission-update', {role: props.role.id}), {
    onSuccess: page => snackbarStore.showSnackbar(page),
  })
}
</script>

<template>
  <AdminLayout
    :title="$t('Assign Permissions')"
    :back="route('admin.settings.roles.index')"
  >
    <template #sub-navbar>
      <SettingsDrawerContent />
    </template>
    <VContainer>
      <VCard class="pa-2">
        <VCardTitle>{{ role.name }}</VCardTitle>
        <VCardText>
          <VForm @submit.prevent="submit">
            <VCol
              cols="12"
            >
              <VTable>
                <template #default>
                  <tbody>
                    <tr>
                      <th>{{ $t('Administrative Access') }}</th>
                      <td>
                        <VCheckbox
                          v-model="select_all"
                          :label="$t('Select All')"
                          @click="selectAll"
                        />
                      </td>
                    </tr>
                    <tr
                      v-for="(group, permissionName) in groups"
                    >
                      <th>{{ permissionName }}</th>
                      <td class="d-flex gap-5">
                        <VCheckbox
                          v-for="(permission) in group"
                          ref="checkboxes"
                          v-model="form.permissions"
                          class="mr-2"
                          :value="permission.id"
                          :label="permission.name.replace('-', ' ').replace(permissionName.toLowerCase(), '')"
                        />
                      </td>
                    </tr>
                  </tbody>
                </template>
              </VTable>
            </VCol>

            <VCol cols="12">
              <VBtn
                :loading="form.processing"
                type="submit"
                block
              >
                {{ $t('Submit') }}
              </VBtn>
            </VCol>
          </VForm>
        </VCardText>
      </VCard>
    </VContainer>
  </AdminLayout>
</template>
