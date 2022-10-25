<script setup>
import {useForm} from "@inertiajs/inertia-vue3"
import rules from "@/plugins/rules"
import {ref} from "vue"

const props = defineProps({
  language: {
    type: Object,
    default: null,
  },
  phrases: {
    type: Object,
    default: null,
  },
})
const valid = ref(false)
const phraseForm = ref()
const form = useForm({
  _method: "PUT",
  phrases: props.phrases,
})


function submit() {
  if (!!valid.value){
    form.post(route('admin.settings.languages.update-phrases', {language: props.language.id}),{
      onSuccess: page => {
        if(page.props.flash.error){
          Notification.error(page.props.flash.error)
        }
        if (page.props.errors){
          errors.value = page.props.errors
        }
      },
    })
  }
}
</script>

<template>
  <AdminLayout>
    <VCard>
      <VCardTitle>{{ $t('Edit Phrases') }}</VCardTitle>
      <VCardSubtitle>{{ $t('Edit :language language phrases', {language: language.name}) }}</VCardSubtitle>
      <VCardText>
        <VForm
          ref="phraseForm"
          v-model="valid"
          lazy-validation
          @submit.prevent="submit"
        >
          <VTable
            class="table-rounded mb-5"
            fixed-header
            fixed-footer
            height="700"
          >
            <thead>
              <tr>
                <th>{{ $t('Key') }}</th>
                <th>{{ $t('Value') }}</th>
              </tr>
            </thead>
            <tbody>
              <tr
                v-for="(phrase, key) in form.phrases"
                :key="key"
              >
                <td width="50%">
                  {{ key }}
                </td>
                <td class="pa-2">
                  <VTextField
                    v-model="form.phrases[key]"
                    :rules="[rules.required]"
                  />
                </td>
              </tr>
            </tbody>
            <tfoot>
              <tr>
                <th>{{ $t('Key') }}</th>
                <th>{{ $t('Value') }}</th>
              </tr>
            </tfoot>
          </VTable>

          <VBtn
            type="submit"
            :loading="form.processing"
            :disabled="!valid"
          >
            <VIcon icon="mdi-content-save" />
            {{ $t('Save') }}
          </VBtn>
        </VForm>
      </VCardText>
    </VCard>
  </AdminLayout>
</template>
