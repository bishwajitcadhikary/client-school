<script setup>
import {inject} from 'vue'

const props = defineProps({
  plan: {
    type: Object,
    required: true,
  },
})

const currencyFormat = inject('currencyFormat')
</script>

<template>
  <AppLayout
    :title="plan.name"
    :back="route('admin.plans.index')"
  >
    <VContainer>
      <VRow justify="center">
        <VCol col="12" sm="6">
          <VCard>
            <VCardText>
              <VTable>
                <tbody>
                  <tr>
                    <th>{{ $t('Plan') }}</th>
                    <td>{{ plan.name }}</td>
                  </tr>
                  <tr>
                    <th>{{ $t('Price') }}</th>
                    <td>{{ currencyFormat(plan.price) }}</td>
                  </tr>
                  <tr>
                    <th>{{ $t('School Limit') }}</th>
                    <td>{{ plan.school_limit }}</td>
                  </tr>
                  <tr>
                    <th>{{ $t('Description') }}</th>
                    <td>
                      <div v-html="plan.description" />
                    </td>
                  </tr>
                </tbody>
              </VTable>
            </VCardText>
          </VCard>
        </VCol>
      </VRow>
    </VContainer>
  </AppLayout>
</template>
