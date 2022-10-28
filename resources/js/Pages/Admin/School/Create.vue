<script setup>
import {ref, watchEffect} from 'vue'
import {useForm} from "@inertiajs/inertia-vue3"
import {Inertia} from "@inertiajs/inertia"
import rules from '@/plugins/rules'
import {useSnackbarStore} from "@/Stores/useSnackbarStore"

const props = defineProps({
  customers: {
    type: Object,
    default: null,
  },
})

const snackbarStore = useSnackbarStore()

const form = useForm({
  customer: null,
  name: null,
  domain: null,
  is_active: true,
})

function submit() {
  form.post(route('admin.schools.store'),{
    onSuccess: page => {
      snackbarStore.showNotification(page)
    },
  })
}

const searchUser = ref(null)
const isUpdating = ref(false)
const filterCustomers = ref([...props.customers.map(customer => {
  return {
    value: customer.id,
    name: customer.name,
    avatar: customer.avatar,
  }
})])

watchEffect(() => {
  if (searchUser.value){
    if (isUpdating.value) return
    isUpdating.value = true

    setTimeout(() => {
      Inertia.visit(route('admin.schools.create'), {
        preserveState: true,
        preserveScroll: true,
        only: ['customers'],
        headers: {
          'search': searchUser.value,
        },
        onSuccess: page => {
          filterCustomers.value = [...page.props.customers.map(customer => {
            return {
              value: customer.id,
              name: customer.name,
              avatar: customer.avatar,
            }
          })]
        },
      })
    }, 500)
    isUpdating.value = false
  }
})
</script>

<template>
  <AdminLayout
    :title="$t('Create School')"
    :back="route('admin.schools.index')"
  >
    <VContainer>
      <VRow justify="center">
        <VCol
          cols="12"
          md="8"
        >
          <VCard>
            <VCardTitle>{{ $t('Create School') }}</VCardTitle>
            <VCardSubtitle>{{ $t('Here you can create new school') }}</VCardSubtitle>
            <VCardText>
              <VForm
                @submit.prevent="submit"
              >
                <VRow>
                  <VCol
                    cols="12"
                  >
                    <VAutocomplete
                      v-model="form.customer"
                      v-model:search="searchUser"
                      :disabled="isUpdating"
                      :items="filterCustomers"
                      filled
                      chips
                      closable-chips
                      :label="$t('Select Customer')"
                      item-title="name"
                      item-value="value"
                    >
                      <template #chip="{ props, item }">
                        <VChip
                          v-bind="props"
                          :prepend-avatar="item.raw.avatar"
                          :text="item.raw.name"
                          :value="item.raw.value"
                        />
                      </template>
                      <template #item="{ props, item }">
                        <VListItem
                          v-if="typeof item.raw !== 'object'"
                          v-bind="props"
                        />
                        <VListItem
                          v-else
                          v-bind="props"
                          :prepend-avatar="item.raw.avatar"
                          :title="item.raw.name"
                          :value="item.raw.value"
                        />
                      </template>
                    </VAutocomplete>
                  </VCol>
                  <VCol
                    cols="12"
                  >
                    <VTextField
                      v-model="form.name"
                      :label="$t('School Name')"
                      :rules="[rules.required]"
                      :error-messages="form.errors.name"
                    />
                  </VCol>
                  <VCol
                    cols="12"
                  >
                    <VTextField
                      v-model="form.domain"
                      :label="$t('Domain')"
                      :rules="[rules.required]"
                      :error-messages="form.errors.domain"
                      hint="example: school.com or school.example.com"
                    />
                  </VCol>

                  <VCol
                    cols="12"
                  >
                    <VSwitch
                      v-model="form.is_active"
                      :label="$t('Active')"
                      :error-messages="form.errors.is_active"
                    />
                  </VCol>

                  <VCol cols="12">
                    <VBtn
                      class="d-md-block"
                      type="submit"
                      :loading="form.processing"
                    >
                      <VIcon icon="mdi-content-save" />
                      {{ $t('Save') }}
                    </VBtn>
                  </VCol>
                </VRow>
              </VForm>
            </VCardText>
          </VCard>
        </VCol>
      </VRow>
    </VContainer>
  </AdminLayout>
</template>
