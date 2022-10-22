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
        title: 'Roles',
        href: route('admin.settings.roles.index'),
        icon: { icon: 'mdi-account-cog-outline' },
        class: {'active' : route().current('admin.settings.roles.*')}
      }"
    />
    <VerticalNavLink
      :item="{
        title: 'File Disks',
        href: route('admin.settings.file-disks.index'),
        icon: { icon: 'mdi-account-cog-outline' },
        class: {'active' : route().current('admin.settings.file-disks.*')}
      }"
    />
    <VerticalNavLink
      :item="{
        title: 'Backups',
        href: route('admin.settings.backups.index'),
        icon: { icon: 'mdi-account-cog-outline' },
        class: {'active' : route().current('admin.settings.backups.*')}
      }"
    />
    <VerticalNavLink
      :item="{
        title: 'Mail Configuration',
        href: route('admin.settings.mail.index'),
        icon: { icon: 'mdi-envelope' },
        class: {'active' : route().current('admin.settings.mail.*')}
      }"
    />
    <!-- 👉 Pages -->
    <VerticalNavSectionTitle :item="{ heading: 'Pages' }" />
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
