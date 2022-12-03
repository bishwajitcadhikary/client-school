<script setup>
import DrawerContent from '../DrawerContent.vue'
import {useForm} from "@inertiajs/inertia-vue3"
import {useSnackbarStore} from "@/Stores/useSnackbarStore"

const props = defineProps({
  school: {
    type: Object,
    required: true,
  },
})

const form = useForm({
  name: null,
  device_id: null,
  auth_code: null,
  auth_user: null,
  is_active: true,
})

const submit = () => {
  form.post(route('admin.schools.settings.fingerprint-devices.store', props.school.id), {
    preserveScroll: true,
    onSuccess: page => useSnackbarStore().showNotification(page),
  })
}
</script>

<template>
  <AppLayout
    :title="$t('Add Device')"
    :back="route('admin.schools.settings.fingerprint-devices.index', school.id)"
  >
    <template #sub-navbar>
      <DrawerContent :school="school" />
    </template>

    <VRow justify="center">
      <VCol
        cols="12"
        md="6"
      >
        <VCard>
          <VCardText>
            <VForm @submit.prevent="submit">
              <VCol cols="12">
                <VTextField
                  v-model="form.name"
                  :label="$t('Name')"
                  :error-messages="form.errors.name"
                  outlined
                />
              </VCol>

              <VCol cols="12">
                <VTextField
                  v-model="form.device_id"
                  :label="$t('Device ID')"
                  :error-messages="form.errors.device_id"
                  outlined
                />
              </VCol>

              <VCol cols="12">
                <VTextField
                  v-model="form.auth_code"
                  :label="$t('Auth Code')"
                  :error-messages="form.errors.auth_code"
                  :hint="$t('Auth Code provided by the Provider')"
                />
              </VCol>

              <VCol cols="12">
                <VTextField
                  v-model="form.auth_user"
                  :label="$t('Auth User')"
                  :error-messages="form.errors.auth_user"
                  :hint="$t('Auth User provided by the Provider')"
                />
              </VCol>

              <VCol cols="12">
                <VSwitch
                  v-model="form.is_active"
                  :label="$t('Is Active')"
                  :error-messages="form.errors.is_active"
                />
              </VCol>

              <VCol cols="12">
                <VBtn
                  :loading="form.processing"
                  color="primary"
                  type="submit"
                  prepend-icon="mdi-content-save"
                >
                  {{ $t('Save') }}
                </VBtn>
              </VCol>
            </VForm>
          </VCardText>
        </VCard>
      </VCol>
    </VRow>
  </AppLayout>
</template>
