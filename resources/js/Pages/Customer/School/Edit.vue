<script setup>
import {useForm} from "@inertiajs/inertia-vue3"
import rules from '@/plugins/rules'
import {useSnackbarStore} from "@/Stores/useSnackbarStore"

const props = defineProps({
  school: {
    type: Object,
    default: null,
  },
})

const snackbarStore = useSnackbarStore()

const form = useForm({
  _method: "PUT",
  name: props.school.name,
  domain: props.school.domain,
})

function submit() {
  form.post(route('customer.schools.update', {school: props.school.id}),{
    onSuccess: page => {
      snackbarStore.showNotification(page)
    },
  })
}
</script>

<template>
  <AppLayout
    :title="$t('Edit School')"
    :back="route('customer.schools.index')"
  >
    <VContainer>
      <VRow justify="center">
        <VCol
          cols="12"
          md="8"
        >
          <VCard>
            <VCardItem>
              <VCardTitle>{{ $t('Edit School') }}</VCardTitle>
              <VAlert
                :title="$t('Be careful')"
                variant="outlined"
                type="warning"
                prominent
                border="top"
                class="d-flex mt-3"
              >
                {{ $t('Website may not work properly if you change the domain name.') }}
              </VAlert>
            </VCardItem>
            <VCardText>
              <VForm @submit.prevent="submit">
                <VRow>
                  <VCol cols="12">
                    <VTextField
                      v-model="form.name"
                      :label="$t('School Name')"
                      :rules="[rules.required]"
                      :error-messages="form.errors.name"
                    />
                  </VCol>
                  <VCol cols="12">
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
                      {{ $t('Update') }}
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
