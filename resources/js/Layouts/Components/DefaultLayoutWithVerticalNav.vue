<script setup>
import DrawerContent from './DrawerContent.vue'
import { VerticalNavLayout } from '@layouts'

// Components
import Footer from '@/Layouts/Components/Footer.vue'
import NavbarThemeSwitcher from '@/Layouts/Components/NavbarThemeSwitcher.vue'
import UserProfile from '@/Layouts/Components/UserProfile.vue'
import NotificationAlert from '@/Layouts/Components/NotificationAlert.vue'
</script>

<template>
  <VerticalNavLayout>
    <!-- 👉 navbar -->
    <template #navbar>
      <!--
        <VTextField
        rounded
        prepend-inner-icon="mdi-magnify"
        density="compact"
        max-width="100px"
        class="app-bar-search d-none d-sm-block"
        />
      -->

      <VSpacer />

      <NavbarThemeSwitcher />
      <NotificationAlert />
      <UserProfile />
    </template>

    <!-- 👉 Drawer content -->
    <template #navigation-drawer-content>
      <DrawerContent />
    </template>

    <!-- 👉 Pages -->
    <div class="layout-page-content">
      <slot />
    </div>

    <!-- 👉 Footer -->
    <template #footer>
      <Footer />
    </template>
  </VerticalNavLayout>
</template>

<style lang="scss">
.app-bar-search {
  .v-input__control {
    width: 236px
  }

  .v-field__outline__start {
    border-radius: 28px 0 0 28px !important;
    flex-basis: 20px !important;
  }

  .v-field__outline__end {
    border-radius: 0 28px 28px 0 !important;
  }
}
</style>
