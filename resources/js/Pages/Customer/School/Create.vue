<script setup>
import {ref, watchEffect} from 'vue'
import {useForm} from "@inertiajs/inertia-vue3"
import {Inertia} from "@inertiajs/inertia"
import rules from '@/plugins/rules'
import {useSnackbarStore} from "@/Stores/useSnackbarStore"

const snackbarStore = useSnackbarStore()

const form = useForm({
  name: null,
  domain: null,
})

function submit() {
  form.post(route('customer.schools.store'),{
    onSuccess: page => {
      snackbarStore.showNotification(page)
    },
  })
}
</script>

<template>
  <AppLayout
    :title="$t('Create School')"
    :back="route('customer.schools.index')"
  >
    <VContainer>
      <VRow justify="center">
        <VCol
          cols="12"
          md="8"
        >
          <VCard>
            <VCardTitle>{{ $t('Create School') }}</VCardTitle>
            <VCardSubtitle>{{ $t('Here you can create new school') }}</VCardSubtitle>
            <VCardText>
              <VForm
                @submit.prevent="submit"
              >
                <VRow>
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

                  <VCol cols="12">
                    <VBtn
                      class="d-md-block"
                      type="submit"
                      :loading="form.processing"
                    >
                      <VIcon icon="mdi-content-save" />
                      {{ $t('Save') }}
                    </VBtn>
                  </VCol>
                </VRow>
              </VForm>
            </VCardText>
          </VCard>
        </VCol>
      </VRow>
    </VContainer>
  </AppLayout>
</template>
