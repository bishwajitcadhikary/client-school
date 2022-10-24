<script setup>
import {useForm} from "@inertiajs/inertia-vue3"
import SettingsDrawerContent from '@/Pages/Admin/Settings/SettingsDrawerContent.vue'

const props = defineProps({
  role: {
    type: Object,
    required: true,
  },
})

const form = useForm({
  name: props.role.name,
})

function submit() {
  form.put(route('admin.settings.roles.update', {role: props.role.id}))
}
</script>

<template>
  <AdminLayout
    :title="$t('Edit Role')"
    :back="route('admin.settings.roles.index')"
  >
    <template #sub-navbar>
      <SettingsDrawerContent />
    </template>
    <VContainer>
      <VRow justify="center">
        <VCol
          cols="12"
          sm="6"
        >
          <VCard>
            <VCardText>
              <VForm @submit.prevent="submit">
                <VCol
                  cols="12"
                >
                  <VTextField
                    v-model="form.name"
                    :label="$t('Name')"
                    :error-messages="form.errors.name"
                    outlined
                    dense
                  />
                </VCol>

                <VCol cols="12">
                  <VBtn
                    :loading="form.processing"
                    type="submit"
                    block
                  >
                    <VIcon>mdi-content-save</VIcon>
                    {{ $t('Submit') }}
                  </VBtn>
                </VCol>
              </VForm>
            </VCardText>
          </VCard>
        </VCol>
      </VRow>
    </VContainer>
  </AdminLayout>
</template>
