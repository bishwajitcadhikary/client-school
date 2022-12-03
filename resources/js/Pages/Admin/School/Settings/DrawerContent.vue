<script setup>
import {trans} from "laravel-vue-i18n"
import {useDisplay} from "vuetify"
import {Inertia} from '@inertiajs/inertia'
import {ref} from 'vue'

const props = defineProps({
  school: {
    type: Object,
    required: true,
  },
})

const {lgAndUp, mdAndDown} = useDisplay()
const drawer = ref(lgAndUp.value)

const menus = [
  {
    title: trans('Finger Print Setting'),
    href: route('admin.schools.settings.index', props.school.id),
    icon: 'mdi-cog',
    active: route().current('admin.schools.settings.index'),
  },
  {
    title: trans('Devices'),
    href: route('admin.schools.settings.fingerprint-devices.index', props.school.id),
    icon: 'mdi-fingerprint',
    active: route().current('admin.schools.settings.fingerprint-devices.*'),
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
    v-model="currentMenu"
    :items="selectMenu"
    :label="$t('Menus')"
    class="mb-5 d-sm-none d-block"
    variant="outlined"
    @update:model-value="onSelectMenu"
  />

  <VNavigationDrawer
    v-model="drawer"
    class="bg-deep-purple d-none d-sm-block"
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
