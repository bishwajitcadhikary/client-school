<script setup>
import {useForm} from "@inertiajs/inertia-vue3"
import rules from '@/plugins/rules'
import {inject} from "vue"
import SettingsDrawerContent from '@/Pages/Admin/Settings/SettingsDrawerContent.vue'

const props = defineProps({
  currencies: {
    type: Object,
    default: null,
  },
})

const Notification = inject('Notification')
const form = useForm({
  name: null,
  logo: null,
  currency: null,
  code: null,
  rate: null,
  status: null,
})

function submit() {
  form.post(route('admin.settings.gateways.store'),{
    onSuccess: page => {
      if(page.props.flash.error){
        Notification.error(page.props.flash.error)
      }
    },
  })
}

function selectCurrency(e) {
  form.rate = props.currencies.find(c => c.value == e)?.rate
}
</script>

<template>
  <AdminLayout
    :title="$t('Create Gateway')"
    :back="route('admin.settings.gateways.index')"
  >
    <template #sub-navbar>
      <SettingsDrawerContent />
    </template>
    <VContainer>
      <VRow>
        <VCol
          cols="12"
          sm="8"
        >
          <VCard>
            <VCardTitle>{{ $t('Create Gateway') }}</VCardTitle>
            <VCardSubtitle>{{ $t('Here you can create new language') }}</VCardSubtitle>
            <VCardText>
              <VForm @submit.prevent="submit">
                <VTextField
                  v-model="form.name"
                  class="mb-5"
                  :label="$t('Gateway Name')"
                  :rules="[rules.required]"
                />

                <VFileInput
                  :prepend-icon="false"
                  class="mb-5"
                  accept="image/png, image/jpeg, image/jpg"
                  :label="$t('Logo')"
                  :rules="rules.image_size_1MB"
                  :placeholder="$t('Pick gateway logo')"
                />

                <VSelect
                  v-model="form.currency"
                  class="mb-5"
                  :label="$t('Gateway Code')"
                  :items="currencies"
                  :rules="[rules.required]"
                  :error-messages="form.errors.currency"
                  @update:modelValue="selectCurrency"
                />

                <VTextField
                  v-model="form.code"
                  class="mb-5"
                  :label="$t('Gateway Code')"
                  disabled
                />

                <VTextField
                  v-model="form.rate"
                  class="mb-5"
                  :label="$t('Gateway Rate')"
                  disabled
                />

                <VSwitch
                  v-model="form.is_active"
                  class="mb-5"
                  :label="$t('Active')"
                  :error-messages="form.errors.is_active"
                />

                <VBtn
                  type="submit"
                  :loading="form.processing"
                >
                  <VIcon icon="mdi-content-save" />
                  {{ $t('Save') }}
                </VBtn>
              </VForm>
            </VCardText>
          </VCard>
        </VCol>
      </VRow>
    </VContainer>
  </AdminLayout>
</template>
