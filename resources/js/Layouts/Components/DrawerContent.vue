<script setup>
import upgradeBannerDark from '@/assets/images/pro/upgrade-banner-dark.png'
import upgradeBannerLight from '@/assets/images/pro/upgrade-banner-light.png'
import logo from '@/assets/logo.svg?raw'
import {
  VerticalNavLink,
  VerticalNavSectionTitle,
  VerticalNavGroup,
  VerticalSubNavLink
} from '@layouts'
import { useTheme } from 'vuetify'

const vuetifyTheme = useTheme()
const upgradeBanner = computed(() => {
  return vuetifyTheme.global.name.value === 'light' ? upgradeBannerLight : upgradeBannerDark
})
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
          Panel
        </h1>
      </Transition>
    </Link>
  </div>

  <!-- 👉 Nav items -->
  <ul>
<!--    <VerticalNavGroup
      title="Settings"
      :icon="{icon: 'mdi-home-outline'}"
    >
      <VerticalSubNavLink
        :item="{
        title: 'Dashboard',
        href: '/asdfasdfasdf',
        class: {'active' : false}
      }"
      />
    </VerticalNavGroup>-->

    <VerticalNavLink
      :item="{
        title: 'Dashboard',
        href: route('admin.dashboard.index'),
        icon: { icon: 'mdi-home-outline' },
        class: {'active' : route().current('admin.dashboard.*')}
      }"
    />
    <VerticalNavLink
      :item="{
        title: 'Account Settings',
        href: 'account-settings',
        icon: { icon: 'mdi-account-cog-outline' }
      }"
    />
    <!-- 👉 Pages -->
    <VerticalNavSectionTitle :item="{ heading: 'Pages' }" />
    <VerticalNavLink
      :item="{
        title: 'Login',
        href: 'login',
        target: '_blank',
        icon: { icon: 'mdi-login' }
      }"
    />
    <VerticalNavLink
      :item="{
        title: 'Register',
        href: 'register',
        target: '_blank',
        icon: { icon: 'mdi-account-plus-outline' }
      }"
    />

    <!-- ℹ️ This path doesn't exist so 404 route will catch this undefined path -->
    <VerticalNavLink
      :item="{
        title: 'Error',
        href: '/error',
        target: '_blank',
        icon: { icon: 'mdi-alert-circle-outline' }
      }"
    />

    <!-- 👉 User Interface -->
    <VerticalNavSectionTitle :item="{ heading: 'User Interface' }" />

    <VerticalNavLink
      :item="{
        title: 'Typography',
        href: 'typography',
        icon: { icon: 'mdi-alpha-t-box-outline' }
      }"
    />
    <VerticalNavLink
      :item="{
        title: 'Icons',
        href: 'icons',
        icon: { icon: 'mdi-eye-outline' }
      }"
    />
    <VerticalNavLink
      :item="{
        title: 'Cards',
        href: 'card-basic',
        icon: { icon: 'mdi-credit-card-outline' }
      }"
    />
    <VerticalNavLink
      :item="{
        title: 'Tables',
        href: 'tables',
        icon: { icon: 'mdi-table' }
      }"
    />
    <VerticalNavLink
      :item="{
        title: 'Form Layouts',
        href: 'form-layouts',
        icon: { icon: 'mdi-form-select' }
      }"
    />
  </ul>

  <!-- 👉 illustration -->
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
