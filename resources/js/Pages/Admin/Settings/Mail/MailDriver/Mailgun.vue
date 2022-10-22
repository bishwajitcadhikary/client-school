<script setup>
import rules from "@/plugins/rules"
import {useMailDriverStore} from "@/Stores/useMailDriverStore"

const mailDriverStore = useMailDriverStore()

function submitForm() {
  mailDriverStore.form.put(route('admin.settings.mail.update'), {
    onSuccess: page => {
      console.log(page)
    },
  })
}

function onChangeDriver(mail_driver) {
  mailDriverStore.form.mail_driver = mail_driver
}
</script>

<template>
  <VForm>
    <VRow>
      <VCol cols="12" sm="6">
        <VSelect
          v-model="mailDriverStore.form.mail_driver"
          :label="$t('Mail Driver')"
          :items="mailDriverStore.mail_drivers"
          :rules="[rules.required]"
          @update:modelValue="onChangeDriver"
        />
      </VCol>

      <VCol cols="12" sm="6">
        <VTextField
          v-model="mailDriverStore.form.mailgun.mail_mailgun_domain"
          :label="$t('Domain')"
        />
      </VCol>

      <VCol cols="12" sm="6">
        <VTextField
          v-model="mailDriverStore.form.mail_mailgun_secret"
          :label="$t('Mailgun Secret')"
        />
      </VCol>

      <VCol cols="12" sm="6">
        <VTextField
          v-model="mailDriverStore.form.mail_mailgun_endpoint"
          :label="$t('Mailgun Endpoint')"
        />
      </VCol>

      <VCol cols="12" sm="6">
        <VTextField
          v-model="mailDriverStore.form.mail_from_address"
          :label="$t('Mail From Address')"
          type="email"
        />
      </VCol>

      <VCol cols="12" sm="6">
        <VTextField
          v-model="mailDriverStore.form.mail_from_name"
          :label="$t('Mail From Name')"
        />
      </VCol>
    </VRow>

    <slot></slot>
  </VForm>
</template>
