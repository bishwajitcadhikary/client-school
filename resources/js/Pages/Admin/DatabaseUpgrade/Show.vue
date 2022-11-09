<script setup>
import {ref} from 'vue'
import {trans} from "laravel-vue-i18n"
import {useForm} from "@inertiajs/inertia-vue3"
import {useSnackbarStore} from "@/Stores/useSnackbarStore"

const props = defineProps({
  upgrade: {
    type: Object,
    required: true,
    default: null,
  },
})
</script>

<template>
  <AppLayout
    :title="upgrade.version"
    :back="route('admin.database-upgrades.index')"
  >
    <VContainer>
      <VRow>
        <VCol
          cols="12"
          md="6"
        >
          <VCard>
            <VCardTitle>{{ $t('Success') }}</VCardTitle>

            <VTable>
              <thead>
                <tr>
                  <th>{{ $t('School') }}</th>
                  <th>{{ $t('Domain') }}</th>
                  <th>{{ $t('Actions') }}</th>
                </tr>
              </thead>
              <tbody>
                <tr
                  v-for="school in upgrade.success"
                  :key="school.id"
                >
                  <td>{{ school.name }}</td>
                  <td>{{ school.domain }}</td>
                  <td>
                    <VBtn
                      variant="plain"
                      @click="$inertia.visit(route('admin.schools.show', school.id))"
                    >
                      <VIcon>mdi-eye</VIcon>
                    </VBtn>
                  </td>
                </tr>
              </tbody>
            </VTable>
          </VCard>
        </VCol>
        <VCol
          cols="12"
          md="6"
        >
          <VCard>
            <VCardTitle>{{ $t('Failed') }}</VCardTitle>

            <VTable>
              <thead>
                <tr>
                  <th>{{ $t('School') }}</th>
                  <th>{{ $t('Domain') }}</th>
                  <th>{{ $t('Error') }}</th>
                  <th>{{ $t('Actions') }}</th>
                </tr>
              </thead>
              <tbody>
                <tr
                  v-for="school in upgrade.failed"
                  :key="school.id"
                >
                  <td>{{ school.name }}</td>
                  <td>{{ school.domain }}</td>
                  <td class="pa-3">
                    <VTextarea
                      :value="school.error"
                      :rows="3"
                    />
                  </td>
                  <td>
                    <VBtn
                      variant="plain"
                      @click="$inertia.visit(route('admin.schools.show', school.id))"
                    >
                      <VIcon>mdi-eye</VIcon>
                    </VBtn>
                  </td>
                </tr>
              </tbody>
            </VTable>
          </VCard>
        </VCol>
      </VRow>
    </VContainer>
  </AppLayout>
</template>
