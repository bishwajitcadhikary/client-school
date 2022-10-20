<script setup>
import {ref} from "vue";

defineProps({
  title: {
    type: String,
    required: true
  },
  icon: {
    type: Object,
    required: true
  },
  badgeContent: {
    type: Number,
    required: false
  },
  badgeClass: {
    type: String,
    required: false
  }
})

const open = ref(false)
</script>

<template>
  <li class="nav-group" :class="{'open' : open}" @click="open = !open">
    <div class="nav-group-label">
      <VIcon
        v-bind="icon"
        class="nav-item-icon"
      />
      <TransitionGroup name="transition-slide-x">
        <!-- 👉 Title -->
        <span
          key="title"
          class="nav-item-title"
        >
          {{ title }}
        </span>

        <!-- 👉 Badge -->
        <span
          v-if="badgeContent"
          key="badge"
          class="nav-item-badge"
          :class="badgeClass"
        >
          {{ badgeContent }}
        </span>
      </TransitionGroup>
    </div>
    <Transition v-show="open">
      <ul class="nav-group-children">
        <slot></slot>
      </ul>
    </Transition>
  </li>
</template>
