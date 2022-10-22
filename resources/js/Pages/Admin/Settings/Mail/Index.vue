<script setup>
import {useMailDriverStore} from "@/Stores/useMailDriverStore"
import Smtp from "@/Pages/Admin/Settings/Mail/MailDriver/Smtp.vue"
import Basic from "@/Pages/Admin/Settings/Mail/MailDriver/Basic.vue"
import Mailgun from "@/Pages/Admin/Settings/Mail/MailDriver/Mailgun.vue"
import Ses from "@/Pages/Admin/Settings/Mail/MailDriver/Ses.vue"
import {computed} from "vue"

const props = defineProps({
  mailConfig: {
    type: Array,
    required: true,
  },
})

const mailDriverStore = useMailDriverStore()
const form = mailDriverStore.form

mailDriverStore.getMailConfig(props.mailConfig)

const mailDriverComponent = computed(() => {
  if (mailDriverStore.form.mail_driver === 'mailgun') return Mailgun
  if (mailDriverStore.form.mail_driver === 'sendmail') return Basic
  if (mailDriverStore.form.mail_driver === 'mail') return Basic
  if (mailDriverStore.form.mail_driver === 'ses') return Ses
  if (mailDriverStore.form.mail_driver === 'smtp') return Smtp

  return Smtp
})
function onChangeDriver() {

}
</script>

<template>
  <AdminLayout :title="$t('Mail Configuration')">
    <VContainer>
      <VRow justify="center">
        <VCol
          cols="12"
          sm="8"
        >
          <VCard class="pa-2">
            <VCardTitle>{{ $t('Mail Configuration') }}</VCardTitle>
            <VCardText>
              <p>{{ $t('Below is the form for Configuring Email driver for sending emails from the app. You can also configure third party providers like Sendgrid, SES etc.') }}</p>

              <Component
                :is="mailDriverComponent"
                @on-change-driver="onChangeDriver"
              >
                <VCol cols="12">
                  <VBtn
                    type="submit"
                  >
                    {{ $t('Save') }}
                  </VBtn>
                </VCol>
              </Component>
            </VCardText>

          </VCard>
        </VCol>
      </VRow>
    </VContainer>
  </AdminLayout>
</template>
