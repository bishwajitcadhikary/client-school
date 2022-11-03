<script setup>
import {useForm} from "@inertiajs/inertia-vue3"
import {useSnackbarStore} from "@/Stores/useSnackbarStore"

const props = defineProps({
  settings: {
    type: Array,
    default: null,
  },
})
</script>

<template>
  <AppLayout :title="$t('DNS Configuration Instruction')">
    <VCard>
      <VCardText>
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
                :model-value="settings.dns_instructions"
                outlined
                rows="3"
                :label="$t('DNS Configuration Instruction')"
                disabled
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
                        model-value="@"
                        disabled
                      />
                    </td>
                    <td>
                      <VTextField
                        :model-value="settings.a_ip"
                        label="Server IP"
                        disabled
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
                        :model-value="settings.cname_domain"
                        label="CNAME Domain"
                        disabled
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
                :model-value="settings.support_instructions"
                outlined
                rows="3"
                :label="$t('Support Instruction')"
                disabled
              />
            </vcol>
          </VRow>
        </VCol>
      </VCardText>
    </VCard>
  </AppLayout>
</template>
