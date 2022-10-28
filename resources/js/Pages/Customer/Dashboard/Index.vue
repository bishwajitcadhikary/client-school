<script setup>
import AnalyticsAward from '@/Pages/Admin/Dashboard/examples/AnalyticsAward.vue'
import AnalyticsBarCharts from '@/Pages/Admin/Dashboard/examples/AnalyticsBarCharts.vue'
import AnalyticsDatatable from '@/Pages/Admin/Dashboard/examples/AnalyticsDatatable.vue'
import AnalyticsDepositWithdraw from '@/Pages/Admin/Dashboard/examples/AnalyticsDepositWithdraw.vue'
import AnalyticsSalesByCountries from '@/Pages/Admin/Dashboard/examples/AnalyticsSalesByCountries.vue'
import AnalyticsTotalEarning from '@/Pages/Admin/Dashboard/examples/AnalyticsTotalEarning.vue'
import AnalyticsTotalProfitLineCharts from '@/Pages/Admin/Dashboard/examples/AnalyticsTotalProfitLineCharts.vue'
import AnalyticsTransactions from '@/Pages/Admin/Dashboard/examples/AnalyticsTransactions.vue'
import AnalyticsWeeklyOverview from '@/Pages/Admin/Dashboard/examples/AnalyticsWeeklyOverview.vue'
import CardStatisticsVertical from '@core/components/CardStatisticsVertical.vue'

const totalProfit = {
  title: 'Total Profit',
  color: 'secondary',
  icon: 'mdi-poll',
  stats: '$25.6k',
  change: 42,
  subtitle: 'Weekly Project',
}
const newProject = {
  title: 'New Project',
  color: 'primary',
  icon: 'mdi-briefcase-variant-outline',
  stats: '862',
  change: -18,
  subtitle: 'Yearly Project',
}
</script>

<template>
  <AppLayout :title="$t('Dashboard')">
    <VRow class="match-height">
      <VCol
        cols="12"
        md="4"
      >
        <AnalyticsAward />
      </VCol>

      <VCol
        cols="12"
        md="8"
      >
        <AnalyticsTransactions />
      </VCol>

      <VCol
        cols="12"
        md="4"
      >
        <AnalyticsWeeklyOverview />
      </VCol>

      <VCol
        cols="12"
        md="4"
      >
        <AnalyticsTotalEarning />
      </VCol>

      <VCol
        cols="12"
        md="4"
      >
        <VRow class="match-height">
          <VCol
            cols="12"
            sm="6"
          >
            <AnalyticsTotalProfitLineCharts />
          </VCol>

          <VCol
            cols="12"
            sm="6"
          >
            <CardStatisticsVertical v-bind="totalProfit" />
          </VCol>

          <VCol
            cols="12"
            sm="6"
          >
            <CardStatisticsVertical v-bind="newProject" />
          </VCol>

          <VCol
            cols="12"
            sm="6"
          >
            <AnalyticsBarCharts />
          </VCol>
        </VRow>
      </VCol>

      <VCol
        cols="12"
        md="4"
      >
        <AnalyticsSalesByCountries />
      </VCol>

      <VCol
        cols="12"
        md="8"
      >
        <AnalyticsDepositWithdraw />
      </VCol>

      <VCol cols="12">
        <AnalyticsDatatable />
      </VCol>
    </VRow>
  </AppLayout>
</template>
