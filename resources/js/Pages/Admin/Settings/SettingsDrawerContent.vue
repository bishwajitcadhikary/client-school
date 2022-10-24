<script setup>
import {trans} from "laravel-vue-i18n"

const menus = [
  {
    title: trans('Account Settings'),
    href: route('admin.settings.account-settings.index'),
    icon: 'mdi-account-cog-outline',
    active: route().current('admin.settings.account-settings.*'),
  },
  {
    title: trans('Roles'),
    href: route('admin.settings.roles.index'),
    icon: 'mdi-shield-star',
    active: route().current('admin.settings.roles.*'),
  },
  {
    title: trans('File Disks'),
    href: route('admin.settings.file-disks.index'),
    icon: 'mdi-folder-arrow-up-down-outline',
    active: route().current('admin.settings.file-disks.*'),
  },
  {
    title: trans('Backups'),
    href: route('admin.settings.backups.index'),
    icon: 'mdi-google-cloud',
    active: route().current('admin.settings.backups.*'),
  },
]
</script>

<template>
  <VNavigationDrawer
    class="bg-deep-purple"
  >
    <VList density="compact">
      <VListItem
        v-for="(menu, index) in menus"
        :key="index"
        :value="index"
        :active="menu.active"
        active-color="primary"
        @click.prevent="$inertia.visit(menu.href)"
      >
        <template #prepend>
          <VIcon :icon="menu.icon" />
        </template>

        <VListItemTitle>{{ menu.title }}</VListItemTitle>
      </VListItem>
    </VList>
  </VNavigationDrawer>
</template>
