<script setup>
import {ref} from 'vue'
import {useForm} from "@inertiajs/inertia-vue3"
import rules from '@/plugins/rules'
import {useSnackbarStore} from "@/Stores/useSnackbarStore"

const snackbarStore = useSnackbarStore()
const formValid = ref(true)

const form = useForm({
  name: null,
  price: 0,
  school_limit: 0,
  max_limit: 0,
  description: null,
  is_active: true,
  is_trial: false,
})

function submit() {
  if (formValid.value){
    form.post(route('admin.plans.store'),{
      onSuccess: page => {
        snackbarStore.showNotification(page)
      },
    })
  }
}
</script>

<template>
  <AppLayout
    :title="$t('Create Plan')"
    :back="route('admin.plans.index')"
  >
    <VContainer>
      <VRow justify="center">
        <VCol
          cols="12"
          md="8"
        >
          <VCard>
            <VCardTitle>{{ $t('Create Plan') }}</VCardTitle>
            <VCardSubtitle>{{ $t('Here you can create new plan') }}</VCardSubtitle>
            <VCardText>
              <VForm @submit.prevent="submit">
                <VRow>
                  <VCol
                    cols="12"
                    md="6"
                  >
                    <VTextField
                      v-model="form.name"
                      :label="$t('Name')"
                      :rules="[rules.required]"
                      :error-messages="form.errors.name"
                    />
                  </VCol>
                  <VCol
                    cols="12"
                    md="6"
                  >
                    <VTextField
                      v-model="form.price"
                      type="number"
                      :prefix="$page.props?.app?.currency?.symbol"
                      :label="$t('Price')"
                      :error-messages="form.errors.price"
                    />
                  </VCol>

                  <VCol
                    cols="12"
                    md="6"
                  >
                    <VTextField
                      v-model="form.school_limit"
                      type="number"
                      :label="$t('School Limit')"
                      :error-messages="form.errors.school_limit"
                      :hint="$t('For unlimited enter 0')"
                    />
                  </VCol>

                  <VCol
                    cols="12"
                    md="6"
                  >
                    <VTextField
                      v-model="form.max_limit"
                      type="number"
                      :label="$t('Max Customer')"
                      :error-messages="form.errors.max_limit"
                      :hint="$t('For unlimited enter 0')"
                    />
                  </VCol>

                  <VCol
                    cols="12"
                  >
                    <VTextarea
                      v-model="form.description"
                      :label="$t('Description')"
                      :error-messages="form.errors.description"
                    />
                  </VCol>

                  <VCol
                    cols="12"
                    md="6"
                  >
                    <VSwitch
                      v-model="form.is_active"
                      :label="$t('Active')"
                      :error-messages="form.errors.is_active"
                    />
                  </VCol>

                  <VCol
                    cols="12"
                    md="6"
                  >
                    <VSwitch
                      v-model="form.is_trial"
                      :label="$t('Trial')"
                      :error-messages="form.errors.is_trial"
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
