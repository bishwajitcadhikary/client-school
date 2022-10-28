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
  school: {
    type: Object,
    default: null,
  },
})

const snackbarStore = useSnackbarStore()

const form = useForm({
  _method: "PUT",
  customer: props.school.customer_id,
  name: props.school.name,
  domain: props.school.domain,
  host: props.school.host,
  port: props.school.port,
  username: props.school.username,
  password: props.school.password,
  database: props.school.database,
  is_active: !!props.school.is_active,
  create_new_database: false,
})

function submit() {
  form.post(route('admin.schools.update', {school: props.school.id}),{
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
      Inertia.visit(route('admin.schools.edit', {school: props.school.id}), {
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
    :title="$t('Edit School')"
    :back="route('admin.schools.index')"
  >
    <VContainer>
      <VRow justify="center">
        <VCol
          cols="12"
          md="8"
        >
          <VCard>
            <VCardItem>
              <VCardTitle>{{ $t('Edit School') }}</VCardTitle>
              <VAlert
                :title="$t('Be careful')"
                variant="outlined"
                type="warning"
                prominent
                border="top"
                class="d-flex justify-space-between mt-3"
              >
                {{ $t('Backup your database before updating.  The database may corrupt during modification.') }}
                <VBtn
                  color="primary"
                  text
                  @click="$inertia.visit(route('admin.settings.backups.index'))"
                >
                  Backup now
                </VBtn>
              </VAlert>
            </VCardItem>
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
                    <VTextField
                      v-model="form.host"
                      :label="$t('DB Host')"
                      :rules="[rules.required]"
                      :error-messages="form.errors.host"
                    />
                  </VCol>

                  <VCol
                    cols="12"
                  >
                    <VTextField
                      v-model="form.port"
                      :label="$t('DB Port')"
                      :rules="[rules.required]"
                      :error-messages="form.errors.port"
                    />
                  </VCol>

                  <VCol
                    cols="12"
                  >
                    <VTextField
                      v-model="form.username"
                      :label="$t('DB Username')"
                      :rules="[rules.required]"
                      :error-messages="form.errors.username"
                    />
                  </VCol>

                  <VCol
                    cols="12"
                  >
                    <VTextField
                      v-model="form.password"
                      :label="$t('DB Password')"
                      :rules="[rules.required]"
                      :error-messages="form.errors.password"
                    />
                  </VCol>

                  <VCol
                    cols="12"
                  >
                    <VTextField
                      v-model="form.database"
                      :label="$t('DB Database')"
                      :rules="[rules.required]"
                      :error-messages="form.errors.database"
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

                  <VCol
                    cols="12"
                  >
                    <VSwitch
                      v-model="form.create_new_database"
                      :label="$t('Create New Database')"
                      :error-messages="form.errors.create_new_database"
                    />
                    <p class="text-error">
                      {{ $t('NB: Existing database will be dropped') }}
                    </p>
                  </VCol>

                  <VCol cols="12">
                    <VBtn
                      class="d-md-block"
                      type="submit"
                      :loading="form.processing"
                    >
                      <VIcon icon="mdi-content-save" />
                      {{ $t('Update') }}
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
