<script setup>
import rules from "@/plugins/rules"
import {useForm} from "@inertiajs/inertia-vue3"

const form = useForm({
  name: null,
  email: null,
  password: null,
  password_confirmation: null,
  language: null,
})

function submit() {

}
</script>

<template>
  <AdminLayout :title="$t('Account Settings')">
    <VContainer>
      <VRow justify="center">
        <VCol
          cols="12"
          sm="8"
        >
          <VCard>
            <VCardTitle>{{ $t('Account Settings') }}</VCardTitle>
            <VCardSubtitle>{{ $t('You can update your name, email & password using the form below.') }}</VCardSubtitle>
            <VCardText>
              <VForm @submit.prevent="submit">
                <VRow>
                  <VCol
                    cols="12"
                    sm="6"
                  >
                    <VTextField
                      v-model="form.name"
                      :label="$t('Name')"
                      :rules="[rules.required()]"
                      :error-messages="form.errors.name"
                    />
                  </VCol>
                  <VCol
                    cols="12"
                    sm="6"
                  >
                    <VTextField
                      v-model="form.email"
                      :label="$t('Email')"
                      :rules="[rules.required()]"
                      :error-messages="form.errors.email"
                    />
                  </VCol>
                  <VCol
                    cols="12"
                    sm="6"
                  >
                    <VTextField
                      v-model="form.password"
                      :label="$t('Password')"
                      :error-messages="form.errors.password"
                    />
                  </VCol>
                  <VCol
                    cols="12"
                    sm="6"
                  >
                    <VTextField
                      v-model="form.password_confirmation"
                      :label="$t('Confirm Password')"
                      :error-messages="form.errors.password_confirmation"
                    />
                  </VCol>
                  <VCol
                    cols="12"
                    sm="6"
                  >
                    <VSelect
                      v-model="form.language"
                      :label="$t('Language')"
                      :error-messages="form.errors.language"
                    />
                  </VCol>
                  <VCol cols="12">
                    <VBtn
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
  </AdminLayout>
</template>
