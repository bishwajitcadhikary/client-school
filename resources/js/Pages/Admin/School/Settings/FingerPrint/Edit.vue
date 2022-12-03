<script setup>
import DrawerContent from '../DrawerContent.vue'
import {useForm} from "@inertiajs/inertia-vue3"
import {useSnackbarStore} from "@/Stores/useSnackbarStore"

const props = defineProps({
  school: {
    type: Object,
    required: true,
  },
  device: {
    type: Object,
    required: true,
  },
})

const form = useForm({
  _method: 'PUT',
  name: props.device?.name,
  device_id: props.device?.device_id,
  auth_code: props.device?.auth_code,
  auth_user: props.device?.auth_user,
  is_active: !!props.device?.is_active,
})

const submit = () => {
  form.post(route('admin.schools.settings.fingerprint-devices.update', {school: props.school.id, fingerprint_device: props.device.id}), {
    preserveScroll: true,
    onSuccess: page => useSnackbarStore().showNotification(page),
  })
}
</script>

<template>
  <AppLayout
    :title="$t('Edit Device')"
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
                  {{ $t('Update Changes') }}
                </VBtn>
              </VCol>
            </VForm>
          </VCardText>
        </VCard>
      </VCol>
    </VRow>
  </AppLayout>
</template>
