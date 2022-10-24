<script setup>
import {useForm} from "@inertiajs/inertia-vue3"
import SettingsDrawerContent from '@/Pages/Admin/Settings/SettingsDrawerContent.vue'
defineProps({
  disks: {
    type: Object,
    default: null,
  },
})

const form = useForm({
  backup_type: 'full',
  file_disk_id: null,
})

const types = [
  {
    title: 'Full',
    value: 'full',
  },
  {
    title: 'Only DB',
    value: 'only-db',
  },
  {
    title: 'Only Files',
    value: 'only-files',
  },
]

function submit() {
  form.post(route('admin.settings.backups.store'))
}
</script>

<template>
  <AdminLayout
    :title="$t('Create Backup')"
    :back="route('admin.settings.file-disks.index')"
  >
    <template #sub-navbar>
      <SettingsDrawerContent />
    </template>

    <VContainer>
      <VCard>
        <VCardTitle>{{ $t('Create Backup') }}</VCardTitle>
        <VForm @submit.prevent="submit">
          <VCardText>
            <VCol cols="12">
              <VSelect
                v-model="form.backup_type"
                :label="$t('Backup Type')"
                :items="types"
                :error-messages="form.errors.backup_type"
                class="mb-12"
                autofocus
              />
              <VSelect
                v-model="form.file_disk_id"
                :label="$t('Backup Disk')"
                :items="disks"
                :error-messages="form.errors.file_disk_id"
              />
            </VCol>
          </VCardText>


          <VCardActions>
            <VSpacer />
            <VBtn
              type="submit"
              :loading="form.processing"
            >
              {{ $t('Submit') }}
            </VBtn>
          </VCardActions>
        </VForm>
      </VCard>
    </VContainer>
  </AdminLayout>
</template>
