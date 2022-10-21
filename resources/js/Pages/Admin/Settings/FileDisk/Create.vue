<script setup>
import {useForm} from "@inertiajs/inertia-vue3";


const form = useForm({
  name: null,
  driver: 'local',
  set_as_default: false,

  local_root: null,

  aws_root: null,
  aws_key: null,
  aws_secret: null,
  aws_region: null,
  aws_bucket: null
})

const drivers = [
  {
    title: 'Local',
    value: 'local'
  },
  {
    title: 'Amazon S3',
    value: 's3'
  }
]

function submit() {
  form.post(route('admin.settings.file-disks.store'))
}
</script>

<template>
  <AdminLayout :title="$t('Add New Disk')" :back="route('admin.settings.file-disks.index')">
    <v-row justify="center">
      <v-col cols="12" sm="8">
        <v-card>
          <v-card-title>{{ $t('Add New Disk') }}</v-card-title>
          <v-form @submit.prevent="submit">
            <v-card-text>
              <v-col cols="12">
                <v-text-field
                  v-model="form.name"
                  :label="$t('Name')"
                  :error-messages="form.errors.name"
                />
              </v-col>

              <v-col cols="12">
                <v-select
                  v-model="form.driver"
                  :label="$t('Driver')"
                  :items="drivers"
                  :error-messages="form.errors.driver"
                />
              </v-col>

              <v-col cols="12" v-if="form.driver === 'local'">
                <v-text-field
                  v-model="form.local_root"
                  :label="$t('Local Root')"
                  :error-messages="form.errors.local_root"
                />
              </v-col>

              <v-col cols="12" v-if="form.driver === 's3'">
                <v-text-field
                  class="mb-5"
                  v-model="form.aws_root"
                  :label="$t('AWS Root')"
                  :error-messages="form.errors.aws_root"
                />
                <v-text-field
                  class="mb-5"
                  v-model="form.aws_key"
                  :label="$t('AWS Driver')"
                  :error-messages="form.errors.aws_key"
                />
                <v-text-field
                  class="mb-5"
                  v-model="form.aws_secret"
                  :label="$t('AWS Secret')"
                  :error-messages="form.errors.aws_secret"
                />
                <v-text-field
                  class="mb-5"
                  v-model="form.aws_region"
                  :label="$t('AWS Region')"
                  :error-messages="form.errors.aws_region"
                />
                <v-text-field
                  class="mb-5"
                  v-model="form.aws_bucket"
                  :label="$t('AWS Bucket')"
                  :error-messages="form.errors.aws_bucket"
                />
              </v-col>

              <v-col cols="12">
                <v-switch
                  v-model="form.set_as_default"
                  :label="$t('Is Default')"
                  :error-messages="form.errors.set_as_default"
                />
              </v-col>
            </v-card-text>



            <v-card-actions>
              <v-spacer></v-spacer>
              <v-btn
                type="submit"
                :loading="form.processing"
              >
                {{ $t('Submit') }}
              </v-btn>
            </v-card-actions>
          </v-form>
        </v-card>
      </v-col>
    </v-row>
  </AdminLayout>
</template>
