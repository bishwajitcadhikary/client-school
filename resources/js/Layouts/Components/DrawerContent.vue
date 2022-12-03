<script setup>
import upgradeBannerDark from '@/assets/images/pro/upgrade-banner-dark.png'
import upgradeBannerLight from '@/assets/images/pro/upgrade-banner-light.png'
import logo from '@/assets/logo.jpg'
import {
  VerticalNavLink,
} from '@layouts'
import { useTheme } from 'vuetify'
import {trans} from "laravel-vue-i18n"
import {computed} from "vue"

const vuetifyTheme = useTheme()
const upgradeBanner = computed(() => {
  return vuetifyTheme.global.name.value === 'light' ? upgradeBannerLight : upgradeBannerDark
})

const adminMenus = [
  {
    title: trans('Dashboard'),
    href: route('admin.dashboard.index'),
    icon: 'mdi-home-outline',
    active: route().current('admin.dashboard.*'),
  },
  {
    title: trans('Customers'),
    href: route('admin.customers.index'),
    icon: 'mdi-users',
    active: route().current('admin.customers.*'),
  },
  {
    title: trans('Schools'),
    href: route('admin.schools.index'),
    icon: 'mdi-town-hall',
    active: route().current('admin.schools.*'),
  },
  {
    title: trans('Plans'),
    href: route('admin.plans.index'),
    icon: 'mdi-package-variant',
    active: route().current('admin.plans.*'),
  },
  {
    title: trans('Orders'),
    href: route('admin.orders.index'),
    icon: 'mdi-cart',
    active: route().current('admin.orders.*'),
  },
  {
    title: trans('Notifications'),
    href: route('admin.notifications.index'),
    icon: 'mdi-bell-outline',
    active: route().current('admin.notifications.*'),
  },
  {
    title: trans('DNS Instruction'),
    href: route('admin.dns.index'),
    icon: 'mdi-network',
    active: route().current('admin.dns.*'),
  },
  {
    title: trans('Database Upgrade'),
    href: route('admin.database-upgrades.index'),
    icon: 'mdi-cog-outline',
    active: route().current('admin.database-upgrades.*'),
  },
  {
    title: trans('Queue Dashboard'),
    href: route('horizon.index'),
    icon: 'mdi-queue',
    active: route().current('horizon.index.*'),
  },
  {
    title: trans('Settings'),
    href: route('admin.settings.account-settings.index'),
    icon: 'mdi-cog-outline',
    active: route().current('admin.settings.*'),
  },
]

const customerMenus = [
  {
    title: trans('Dashboard'),
    href: route('customer.dashboard.index'),
    icon: 'mdi-home-outline',
    active: route().current('customer.dashboard.*'),
  },
  {
    title: trans('Profile'),
    href: route('customer.profile.index'),
    icon: 'mdi-account-outline',
    active: route().current('customer.profile.*'),
  },
  {
    title: trans('Schools'),
    href: route('customer.schools.index'),
    icon: 'mdi-town-hall',
    active: route().current('customer.schools.*'),
  },
  {
    title: trans('Subscription'),
    href: route('customer.subscription.index'),
    icon: 'mdi-trophy-outline',
    active: route().current('customer.subscription.*'),
  },
  {
    title: trans('Orders'),
    href: route('customer.orders.index'),
    icon: 'mdi-cart',
    active: route().current('customer.orders.*'),
  },
  {
    title: trans('Notifications'),
    href: route('customer.notifications.index'),
    icon: 'mdi-bell-outline',
    active: route().current('customer.notifications.*'),
  },
  {
    title: trans('DNS Instruction'),
    href: route('customer.dns.index'),
    icon: 'mdi-network',
    active: route().current('customer.dns.*'),
  },
]
</script>

<template>
  <!-- 👉 Nav header -->
  <div class="nav-header">
    <Link
      href="/"
      class="app-logo d-flex align-center gap-x-3 app-title-wrapper"
    >
      <!-- ℹ️ You can also use img tag or VImg here -->
      <VImg
        :src="logo"
        alt=""
        class="w-100"
      />

      <Transition name="vertical-nav-app-title">
        <h1 class="font-weight-semibold leading-normal text-xl text-uppercase">
          {{ $page.props.app.name }}
        </h1>
      </Transition>
    </Link>
  </div>

  <!-- 👉 Nav items -->
  <ul>
    <VerticalNavLink
      v-for="(menu, key) in $page.props.auth.user.role === 'admin' ? adminMenus : customerMenus"
      :key="key"
      :item="{
        title: menu.title,
        href: menu.href,
        icon: { icon: menu.icon },
        class: {'active' : menu.active}
      }"
    />
  </ul>
</template>

<style lang="scss">
// .v-navigation-drawer {
//   height: 100%;

//   .v-navigation-drawer__content {
//     display: flex;
//     flex-direction: column;

//     > ul {
//       flex-grow: 1;
//     }
//   }
// }

.upgrade-banner {
  margin-top: auto;
  // position: absolute;
  // bottom: 13px;
  // left: 50%;
  // transform: translateX(-50%);
}
</style>
