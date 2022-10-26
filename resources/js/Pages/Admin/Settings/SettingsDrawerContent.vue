<script setup>
import {trans} from "laravel-vue-i18n"
import {useDisplay} from "vuetify"
import {Inertia} from '@inertiajs/inertia'
import {ref} from 'vue'

const {lgAndUp, mdAndDown} = useDisplay()
const drawer = ref(lgAndUp.value)

const menus = [
  {
    title: trans('Account Settings'),
    href: route('admin.settings.account-settings.index'),
    icon: 'mdi-account-cog-outline',
    active: route().current('admin.settings.account-settings.*'),
  },
  {
    title: trans('Preferences'),
    href: route('admin.settings.preferences.index'),
    icon: 'mdi-cog-outline',
    active: route().current('admin.settings.preferences.*'),
  },
  {
    title: trans('Currencies'),
    href: route('admin.settings.currencies.index'),
    icon: 'mdi-money',
    active: route().current('admin.settings.currencies.*'),
  },
  {
    title: trans('Gateways'),
    href: route('admin.settings.gateways.index'),
    icon: 'mdi-credit-card-outline',
    active: route().current('admin.settings.gateways.*'),
  },
  {
    title: trans('Roles'),
    href: route('admin.settings.roles.index'),
    icon: 'mdi-shield-star',
    active: route().current('admin.settings.roles.*'),
  },
  {
    title: trans('Languages'),
    href: route('admin.settings.languages.index'),
    icon: 'mdi-translate',
    active: route().current('admin.settings.languages.*'),
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
  {
    title: trans('Mail Configuration'),
    href: route('admin.settings.mail.index'),
    icon: 'mdi-email-sync-outline',
    active: route().current('admin.settings.mail.*'),
  },
]

const selectMenu = menus.map(menu => {
  return {
    title: menu.title,
    value: menu.href,
    active: menu.active,
  }
})

const currentMenu = ref(selectMenu.find(menu => menu.active))

function onSelectMenu(href) {
  Inertia.visit(href)
}
</script>

<template>
  <VSelect
    v-if="!drawer"
    v-model="currentMenu"
    :items="selectMenu"
    :label="$t('Select Menu')"
    @update:modelValue="onSelectMenu"
  />

  <VNavigationDrawer
    v-if="drawer"
    v-model="drawer"
    class="bg-deep-purple"
  >
    <VList density="compact">
      <VListItem
        v-for="(menu, index) in menus"
        :key="index"
        :active="menu.active"
        :value="index"
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
