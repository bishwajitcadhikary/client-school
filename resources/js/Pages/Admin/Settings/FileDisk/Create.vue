<script setup>
import {useForm} from "@inertiajs/inertia-vue3"
import SettingsDrawerContent from '@/Pages/Admin/Settings/SettingsDrawerContent.vue'

const props = defineProps({
  local_root: {
    type: String,
    default: null,
  },
})

const form = useForm({
  name: null,
  driver: 'local',
  set_as_default: false,

  local_root: props.local_root,

  aws_root: null,
  aws_key: null,
  aws_secret: null,
  aws_region: null,
  aws_bucket: null,
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
  form.post(route('admin.settings.file-disks.store'))
}
</script>

<template>
  <AdminLayout
    :title="$t('Add New Disk')"
    :back="route('admin.settings.file-disks.index')"
  >
    <template #sub-navbar>
      <SettingsDrawerContent />
    </template>

    <VContainer>
      <VCard>
        <VCardTitle>{{ $t('Add New Disk') }}</VCardTitle>
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
  </AdminLayout>
</template>
