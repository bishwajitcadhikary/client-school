<script setup>
import rules from "@/plugins/rules"
import {useMailDriverStore} from "@/Stores/useMailDriverStore"

const emit = defineEmits(['on-change-driver', 'loading'])
const mailDriverStore = useMailDriverStore()

function submitForm() {
  mailDriverStore.form.put(route('admin.settings.mail.update'), {
    onSuccess: page => {
      console.log(page)
    }
  })
}

function onChangeDriver(mail_driver) {
  mailDriverStore.form.mail_driver = mail_driver
  // eslint-disable-next-line vue/custom-event-name-casing
  emit('on-change-driver', mail_driver)

}
</script>

<template>
  <VForm @submit.prevent="submitForm">
    <VRow>
      <VCol
        cols="12"
        sm="6"
      >
        <VSelect
          v-model="mailDriverStore.form.mail_driver"
          :label="$t('Mail Driver')"
          :items="mailDriverStore.mail_drivers"
          :rules="[rules.required]"
          @update:modelValue="onChangeDriver"
        />
      </VCol>

      <VCol
        cols="12"
        sm="6"
      >
        <VTextField
          v-model="mailDriverStore.form.smtp.mail_host"
          :label="$t('Mail Host')"
        />
      </VCol>

      <VCol
        cols="12"
        sm="6"
      >
        <VTextField
          v-model.trim="mailDriverStore.form.smtp.mail_username"
          :label="$t('Mail Username')"
        />
      </VCol>

      <VCol
        cols="12"
        sm="6"
      >
        <VTextField
          v-model.trim="mailDriverStore.form.smtp.mail_password"
          :label="$t('Mail Password')"
        />
      </VCol>

      <VCol
        cols="12"
        sm="6"
      >
        <VTextField
          v-model="mailDriverStore.form.smtp.mail_port"
          :label="$t('Mail Port')"
        />
      </VCol>

      <VCol
        cols="12"
        sm="6"
      >
        <VSelect
          v-model="mailDriverStore.form.smtp.mail_encryption"
          :label="$t('Mail Encryption')"
          :items="mailDriverStore.mail_encryption"
        />
      </VCol>

      <VCol
        cols="12"
        sm="6"
      >
        <VTextField
          v-model="mailDriverStore.form.smtp.mail_from_address"
          :label="$t('Mail From Address')"
          type="email"
        />
      </VCol>

      <VCol
        cols="12"
        sm="6"
      >
        <VTextField
          v-model="mailDriverStore.form.smtp.mail_from_name"
          :label="$t('Mail From Name')"
        />
      </VCol>
    </VRow>

    <slot />
  </VForm>
</template>
