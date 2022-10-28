<script setup>
import {useForm} from "@inertiajs/inertia-vue3"
import SettingsDrawerContent from '@/Pages/Admin/Settings/SettingsDrawerContent.vue'
const props = defineProps({
  disk: {
    type: Object,
    required: true,
  },
})

const credentials = JSON.parse(props.disk.credentials)

const form = useForm({
  name: props.disk.name,
  driver: props.disk.driver,
  set_as_default: props.disk.set_as_default,

  local_root: credentials?.local_root,

  aws_root: credentials?.aws_root,
  aws_key: credentials?.aws_key,
  aws_secret: credentials?.aws_secret,
  aws_region: credentials?.aws_region,
  aws_bucket: credentials?.aws_bucket,
})

const drivers = [
  {
    title: 'Local',
    value: 'local',
  },
  {
    title: 'Amazon S3',
    value: 's3',
  },
]

function submit() {
  form.put(route('admin.settings.file-disks.update', {file_disk: props.disk.id}))
}
</script>

<template>
  <AppLayout
    :title="$t('Edit Disk')"
    :back="route('admin.settings.file-disks.index')"
  >
    <template #sub-navbar>
      <SettingsDrawerContent />
    </template>
    <VContainer>
      <VCard>
        <VCardTitle>{{ $t('Edit Disk') }}</VCardTitle>
        <VForm @submit.prevent="submit">
          <VCardText>
            <VCol cols="12">
              <VTextField
                v-model="form.name"
                :label="$t('Name')"
                :error-messages="form.errors.name"
              />
            </VCol>

            <VCol cols="12">
              <VSelect
                v-model="form.driver"
                :label="$t('Driver')"
                :items="drivers"
                :error-messages="form.errors.driver"
              />
            </VCol>

            <VCol
              v-if="form.driver === 'local'"
              cols="12"
            >
              <VTextField
                v-model="form.local_root"
                :label="$t('Local Root')"
                :error-messages="form.errors.local_root"
              />
            </VCol>

            <VCol
              v-if="form.driver === 's3'"
              cols="12"
            >
              <VTextField
                v-model="form.aws_root"
                class="mb-5"
                :label="$t('AWS Root')"
                :error-messages="form.errors.aws_root"
              />
              <VTextField
                v-model="form.aws_key"
                class="mb-5"
                :label="$t('AWS Driver')"
                :error-messages="form.errors.aws_key"
              />
              <VTextField
                v-model="form.aws_secret"
                class="mb-5"
                :label="$t('AWS Secret')"
                :error-messages="form.errors.aws_secret"
              />
              <VTextField
                v-model="form.aws_region"
                class="mb-5"
                :label="$t('AWS Region')"
                :error-messages="form.errors.aws_region"
              />
              <VTextField
                v-model="form.aws_bucket"
                class="mb-5"
                :label="$t('AWS Bucket')"
                :error-messages="form.errors.aws_bucket"
              />
            </VCol>

            <VCol cols="12">
              <VSwitch
                v-model="form.set_as_default"
                :label="$t('Is Default')"
                :error-messages="form.errors.set_as_default"
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
  </AppLayout>
</template>
