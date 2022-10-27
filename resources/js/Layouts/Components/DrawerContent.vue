<script setup>
import upgradeBannerDark from '@/assets/images/pro/upgrade-banner-dark.png'
import upgradeBannerLight from '@/assets/images/pro/upgrade-banner-light.png'
import logo from '@/assets/logo.svg?raw'
import {
  VerticalNavLink,
  VerticalNavSectionTitle,
  VerticalNavGroup,
  VerticalSubNavLink,
} from '@layouts'
import { useTheme } from 'vuetify'
import {trans} from "laravel-vue-i18n"

const vuetifyTheme = useTheme()
const upgradeBanner = computed(() => {
  return vuetifyTheme.global.name.value === 'light' ? upgradeBannerLight : upgradeBannerDark
})

const menus = [
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
    title: trans('Settings'),
    href: route('admin.settings.account-settings.index'),
    icon: 'mdi-cog-outline',
    active: route().current('admin.settings.*'),
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
      <div v-html="logo" />

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
      v-for="(menu, key) in menus"
      :key="key"
      :item="{
        title: menu.title,
        href: menu.href,
        icon: { icon: menu.icon },
        class: {'active' : menu.active}
      }"
    />

    <VerticalNavSectionTitle :item="{ heading: 'Pages' }" />
  </ul>

  <!-- 👉 illustration -->
<!--
  <a
  href="https://themeselection.com/item/materio-vuetify-vuejs-admin-template"
  target="_blank"
  rel="noopener noreferrer"
  >
  <img
  :src="upgradeBanner"
  alt="upgrade-banner"
  transition="scale-transition"
  class="upgrade-banner mx-auto"
  style="max-width: 230px"
  >
  </a>
-->
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
