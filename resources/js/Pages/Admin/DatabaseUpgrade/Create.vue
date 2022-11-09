<script setup>
import {useForm} from "@inertiajs/inertia-vue3"
import {useSnackbarStore} from "@/Stores/useSnackbarStore"

const props = defineProps({
  customers: {
    type: Object,
    default: null,
  },
})

const form = useForm({
  version: null,
  database: null,
  change_log: null,
})

function submit() {
  form.post(route('admin.database-upgrades.store'),{
    onSuccess: page => {
      useSnackbarStore().showNotification(page)
    },
  })
}

const databaseSelected = database => {
  form.database = database[0]
}
</script>

<template>
  <AppLayout
    :title="$t('New Upgrade')"
    :back="route('admin.database-upgrades.index')"
  >
    <VContainer>
      <VRow justify="center">
        <VCol
          cols="12"
          md="8"
        >
          <VCard>
            <VCardTitle>{{ $t('New Upgrade') }}</VCardTitle>
            <VCardSubtitle>{{ $t('Create a new database upgrade') }}</VCardSubtitle>

            <VCardText>
              <VAlert
                color="error"
                variant="outlined"
                icon="mdi-alert-circle-outline"
              >
                <VAlertTitle>{{ $t('Warning') }}</VAlertTitle>
                {{ $t('Please make sure you have a backup of your database before upgrading. Database upgrade is irreversible.') }}
                <br><br>
                <VBtn
                  :href="route('admin.database-upgrades.download-backup')"
                >
                  {{ $t('Create Backup') }}
                </VBtn>
              </VAlert>
            </VCardText>

            <VCardText>
              <VForm
                @submit.prevent="submit"
              >
                <VFileInput
                  :label="$t('MySQL File')"
                  :rules="[v => !!v || $t('Database is required')]"
                  :error-messages="form.errors.database"
                  outlined
                  accept=".sql"
                  class="mb-5"
                  prepend-inner-icon="mdi-database"
                  :prepend-icon="false"
                  @update:modelValue="databaseSelected"
                />

                <VTextField
                  v-model="form.version"
                  :label="$t('Version')"
                  :rules="[v => !!v || $t('Version is required')]"
                  :error-messages="form.errors.version"
                  outlined
                  class="mb-5"
                />

                <VTextarea
                  v-model="form.change_log"
                  :label="$t('Change Log')"
                  :rules="[v => !!v || $t('Change Log is required')]"
                  :error-messages="form.errors.change_log"
                  outlined
                  class="mb-5"
                />

                <VBtn
                  type="submit"
                  color="primary"
                  :loading="form.processing"
                  :disabled="form.processing"
                >
                  {{ $t('Upgrade') }}
                </VBtn>
              </VForm>
            </VCardText>
          </VCard>
        </VCol>
      </VRow>
    </VContainer>
  </AppLayout>
</template>
