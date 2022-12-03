<script setup>
import {useForm} from "@inertiajs/inertia-vue3"
import {useSnackbarStore} from "@/Stores/useSnackbarStore"
import {ref} from "vue"

const props = defineProps({
  settings: {
    type: Array,
    default: null,
  },
})

const dialog = ref(false)
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
                readonly
              />
            </VCol>
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
                        readonly
                      />
                    </td>
                    <td>
                      <VTextField
                        model-value="@"
                        readonly
                      />
                    </td>
                    <td>
                      <VTextField
                        :model-value="settings.a_ip"
                        label="Server IP"
                        readonly
                      />
                    </td>
                  </tr>
                  <tr>
                    <td class="pa-3">
                      <VTextField
                        model-value="CNAME"
                        readonly
                      />
                    </td>
                    <td>
                      <VTextField
                        model-value="www"
                        readonly
                      />
                    </td>
                    <td>
                      <VTextField
                        :model-value="settings.cname_domain"
                        label="CNAME Domain"
                        readonly
                      />
                    </td>
                  </tr>
                </tbody>
              </VTable>
            </VCol>
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
                readonly
              />
            </VCol>
          </VRow>
        </VCol>

        <VCol
          v-if="settings.video_url"
          cols="12"
        >
          <VRow>
            <VCol
              cols="12"
              md="4"
              class="text-left text-md-right"
            />
            <VCol
              cols="12"
              md="8"
            >
              <VBtn
                icon
                @click="dialog = true"
              >
                <VIcon>mdi-videocam</VIcon>
              </VBtn>
            </VCol>
          </VRow>
        </VCol>
      </VCardText>
    </VCard>

    <VDialog
      v-model="dialog"
      :style="{minWidth: 'auto'}"
      class="text-center"
    >
      <VCard>
        <VCardTitle>
          {{ $t('DNS Configuration Instruction') }}
        </VCardTitle>

        <VCardText>
          <iframe
            width="1440"
            height="720"
            :src="settings.video_url"
            frameborder="0"
            allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture"
            allowfullscreen
          />
        </VCardText>

        <VCardActions>
          <VBtn
            color="primary"
            block
            @click="dialog = false"
          >
            {{ $t('Close') }}
          </VBtn>
        </VCardActions>
      </VCard>
    </VDialog>
  </AppLayout>
</template>
