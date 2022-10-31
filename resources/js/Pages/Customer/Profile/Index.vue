<script setup>
import AccountSettingsAccount from './AccountSettingsAccount.vue'
import AccountSettingsNotification from './AccountSettingsNotification.vue'
import AccountSettingsSecurity from './AccountSettingsSecurity.vue'

defineProps({
  customer: {
    type: Object,
    required: true,
  },
  languages: {
    type: [Array, Object],
    required: true,
  },
  countries: {
    type: [Array, Object],
    required: true,
  },
  currencies: {
    type: [Array, Object],
    required: true,
  },
  timeZones: {
    type: [Array, Object],
    required: true,
  },
})

const activeTab = ref(null)

// tabs
const tabs = [
  {
    title: 'Account',
    icon: 'mdi-account-outline',
    tab: 'account',
  },
  {
    title: 'Security',
    icon: 'mdi-lock-open-outline',
    tab: 'security',
  },
]
</script>

<template>
  <AppLayout :title="$t('Profile')">
    <VTabs
      v-model="activeTab"
      show-arrows
    >
      <VTab
        v-for="item in tabs"
        :key="item.icon"
        :value="item.tab"
      >
        <VIcon
          size="20"
          start
          :icon="item.icon"
        />
        {{ item.title }}
      </VTab>
    </VTabs>
    <VDivider />

    <VWindow
      v-model="activeTab"
      class="mt-5 disable-tab-transition"
      :touch="false"
    >
      <!-- Account -->
      <VWindowItem value="account">
        <AccountSettingsAccount
          :customer="customer"
          :languages="languages"
          :countries="countries"
          :currencies="currencies"
          :time-zones="timeZones"
          :requires-confirmation="false"
        />
      </VWindowItem>

      <!-- Security -->
      <VWindowItem value="security">
        <AccountSettingsSecurity />
      </VWindowItem>

      <!-- Notification -->
      <!--
        <VWindowItem value="notification">
        <AccountSettingsNotification />
        </VWindowItem>
      -->
    </VWindow>
  </AppLayout>
</template>
