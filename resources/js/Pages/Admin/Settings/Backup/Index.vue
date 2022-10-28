<script setup>
import {ref,inject} from "vue"
import {useForm} from "@inertiajs/inertia-vue3"

import SettingsDrawerContent from '@/Pages/Admin/Settings/SettingsDrawerContent.vue'
import {useSnackbarStore} from "@/Stores/useSnackbarStore"

defineProps({
  backups: {
    type: Object,
    default: null,
  },
})

const snackbarStore = useSnackbarStore()
const dialog = ref(false)
const deletablePath = ref(null)
const disk = ref(null)

function destroy(path) {
  dialog.value = false
  useForm({
    path: deletablePath?.value,
  }).delete(route('admin.settings.backups.destroy', {backup: 'delete'}), {
    onSuccess: page => {
      snackbarStore.showNotification(page)
    },
  })
}
</script>

<template>
  <AppLayout
    :title="$t('Backups')"
    :action="{
      title: $t('Add New'),
      href: route('admin.settings.backups.create'),
      icon: 'mdi-plus'
    }"
  >
    <template #sub-navbar>
      <SettingsDrawerContent />
    </template>
    <VContainer>
      <VCard>
        <VCardText>
          <VTable>
            <template #default>
              <thead>
                <tr>
                  <th>{{ $t('Path') }}</th>
                  <th>{{ $t('Size') }}</th>
                  <th>{{ $t('Created At') }}</th>
                  <th />
                </tr>
              </thead>
              <tbody>
                <tr v-for="(backup) in backups">
                  <td>{{ backup.path }}</td>
                  <td>{{ backup.size }}</td>
                  <td>{{ backup.created_at }}</td>
                  <td class="pa-1">
                    <VBtnToggle divided>
                      <VBtn
                        size="small"
                        variant="outlined"
                        color="primary"
                        icon="mdi-download"
                        :href="route('admin.settings.backups.download', {path: backup.path})"
                        download
                      />
                      <VBtn
                        size="small"
                        variant="outlined"
                        color="primary"
                        icon="mdi-trash"
                        @click.stop="dialog = true; deletablePath = backup.path"
                      />
                    </VBtnToggle>
                  </td>
                </tr>
              </tbody>
            </template>
          </VTable>

          <VDialog
            v-model="dialog"
            max-width="450"
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
                  @click.stop="destroy"
                >
                  {{ $t('Delete') }}
                </VBtn>
              </VCardActions>
            </VCard>
          </VDialog>
        </VCardText>
      </VCard>
    </VContainer>
  </AppLayout>
</template>
