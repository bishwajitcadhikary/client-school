<script setup>
import { getComputedNavLinkToProp } from '@layouts/utils'
import {Link} from '@inertiajs/inertia-vue3'

const props = defineProps({
  item: {
    type: null,
    required: true,
  },
})
</script>

<template>
  <li
    class="nav-link"
    :class="{ disabled: item.disable }"
  >
    <Component
      :is="item.href ? Link : 'a'"
      v-bind="getComputedNavLinkToProp(item)"
    >
      <VIcon
        v-bind="{icon: 'mdi-circle-outline'}"
        class="nav-item-icon"
      />
      <TransitionGroup name="transition-slide-x">
        <!-- 👉 Title -->
        <span
          key="title"
          class="nav-item-title"
        >
          {{ item.title }}
        </span>

        <!-- 👉 Badge -->
        <span
          v-if="item.badgeContent"
          key="badge"
          class="nav-item-badge"
          :class="item.badgeClass"
        >
          {{ item.badgeContent }}
        </span>
      </TransitionGroup>
    </Component>
  </li>
</template>

<style lang="scss">
.layout-vertical-nav {
  .nav-link a {
    display: flex;
    align-items: center;
  }
}
</style>
