<script setup>
import {useForm} from "@inertiajs/inertia-vue3"
import {useSnackbarStore} from "@/Stores/useSnackbarStore"

const props = defineProps({
  settings: {
    type: Array,
    default: null,
  },
})

const form = useForm({
  _method: 'PUT',
  a_ip: props.settings.a_ip,
  cname_domain: props.settings.cname_domain,
  dns_instructions: props.settings.dns_instructions,
  support_instructions: props.settings.support_instructions,
})

const submit = () => {
  form.post(route('admin.dns.update'), {
    preserveScroll: true,
    onSuccess: page => {
      useSnackbarStore().showNotification(page)
    },
  })
}
</script>

<template>
  <AppLayout :title="$t('DNS Configuration Instruction')">
    <VCard>
      <VCardText>
        <VForm @submit.prevent="submit">
          <VCol cols="12">
            <VRow>
              <VCol
                cols="12"
                md="4"
                class="text-left text-md-right"
              >
                {{ $t('Configure DNS record instructions') }}
              </VCol>
              <VCol
                cols="12"
                md="8"
              >
                <VTextarea
                  v-model="form.dns_instructions"
                  outlined
                  rows="3"
                  :label="$t('DNS Configuration Instruction')"
                  :placeholder="$t('DNS Configuration Instruction')"
                />
              </vcol>
            </VRow>
          </VCol>

          <VCol cols="12">
            <VRow>
              <VCol
                cols="12"
                md="4"
                class="text-left text-md-right"
              >
                {{ $t('DNS Record Settings') }}
              </VCol>
              <VCol
                cols="12"
                md="8"
              >
                <VTable>
                  <thead>
                    <tr>
                      <th>{{ $t('TYPE') }}</th>
                      <th>{{ $t('Record') }}</th>
                      <th>{{ $t('Value') }}</th>
                    </tr>
                  </thead>
                  <tbody>
                    <tr>
                      <td class="pa-3">
                        <VTextField
                          model-value="A"
                          disabled
                        />
                      </td>
                      <td>
                        <VTextField
                          disabled
                        />
                      </td>
                      <td>
                        <VTextField
                          v-model="form.a_ip"
                          label="Server IP"
                          placeholder="127.0.01"
                        />
                      </td>
                    </tr>
                    <tr>
                      <td class="pa-3">
                        <VTextField
                          model-value="CNAME"
                          disabled
                        />
                      </td>
                      <td>
                        <VTextField
                          model-value="www"
                          disabled
                        />
                      </td>
                      <td>
                        <VTextField
                          v-model="form.cname_domain"
                          label="CNAME Domain"
                          :placeholder="$page.props.app.url"
                        />
                      </td>
                    </tr>
                  </tbody>
                </VTable>
              </vcol>
            </VRow>
          </VCol>

          <VCol cols="12">
            <VRow>
              <VCol
                cols="12"
                md="4"
                class="text-left text-md-right"
              >
                {{ $t('Support instructions') }}
              </VCol>
              <VCol
                cols="12"
                md="8"
              >
                <VTextarea
                  v-model="form.support_instructions"
                  outlined
                  rows="3"
                  :label="$t('Support Instruction')"
                  :placeholder="$t('Support Instruction')"
                />
              </vcol>
            </VRow>
          </VCol>

          <VCol cols="12">
            <VRow>
              <VCol
                cols="12"
                md="4"
              />
              <VCol
                cols="12"
                md="8"
              >
                <VBtn
                  type="submit"
                  :loading="form.processing"
                >
                  {{ $t('Save') }}
                </VBtn>
              </vcol>
            </VRow>
          </VCol>
        </VForm>
      </VCardText>
    </VCard>
  </AppLayout>
</template>
