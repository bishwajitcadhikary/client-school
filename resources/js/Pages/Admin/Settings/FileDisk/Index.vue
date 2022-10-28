<script setup>
import {ref,inject} from "vue"
import {useForm} from "@inertiajs/inertia-vue3"
import SettingsDrawerContent from '@/Pages/Admin/Settings/SettingsDrawerContent.vue'
import {useSnackbarStore} from "@/Stores/useSnackbarStore"

defineProps({
  disks: {
    type: Object,
    default: null,
  },
})

const snackbarStore = useSnackbarStore()

const dialog = ref(false)
let deletableId = ref(null)
function destroy() {
  dialog.value = false
  useForm({}).delete(route('admin.settings.file-disks.destroy', {file_disk: deletableId?.value}), {
    onSuccess: page => {
      snackbarStore.showNotification(page)
    },
  })
}
</script>

<template>
  <AppLayout
    :title="$t('File Disks')"
    :action="{
      title: $t('Add New'),
      href: route('admin.settings.file-disks.create'),
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
                  <th>{{ $t('Disk Name') }}</th>
                  <th>{{ $t('Filesystem Driver') }}</th>
                  <th>{{ $t('Type') }}</th>
                  <th>{{ $t('Is Default') }}</th>
                  <th />
                </tr>
              </thead>
              <tbody>
                <tr
                  v-for="(disk, index) in disks.data"
                  :key="index"
                >
                  <td>{{ disk.name }}</td>
                  <td>{{ disk.driver }}</td>
                  <td>{{ disk.type }}</td>
                  <td>
                    <VIcon
                      :icon="disk.set_as_default ? 'mdi-check' : 'mdi-alpha-x'"
                      :color="disk.set_as_default ? 'success' : 'error'"
                    />
                  </td>
                  <td class="pa-1">
                    <VBtnToggle divided>
                      <VBtn
                        size="small"
                        variant="outlined"
                        color="primary"
                        icon="mdi-edit"
                        @click="$inertia.visit(route('admin.settings.file-disks.edit', {file_disk: disk.id}))"
                      />
                      <VBtn
                        size="small"
                        variant="outlined"
                        color="primary"
                        icon="mdi-trash"
                        @click.stop="dialog = true; deletableId = disk.id"
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
