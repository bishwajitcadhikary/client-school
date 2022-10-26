<script setup>
defineProps({
  title: {
    type: String,
    default: null,
  },
  action: {
    type: Object,
    default: null,
  },
  actions: {
    type: Array,
    default: null,
  },
  back: {
    type: String,
    default: null,
  },
})
</script>

<template>
  <VAppBar
    v-if="title || actions"
    elevation="4"
  >
    <VToolbarTitle>{{ title }}</VToolbarTitle>
    <VSpacer />
    <slot name="actions" />

    <VBtn
      v-for="(ac, key) in actions"
      :key="key"
      @click="$inertia.visit(ac.href)"
    >
      <VIcon v-if="ac.icon">
        {{ ac.icon }}
      </VIcon>
      {{ ac.title }}
    </VBtn>

    <VBtn
      v-if="action"
      @click="$inertia.visit(action.href)"
    >
      <VIcon v-if="action.icon">
        {{ action.icon }}
      </VIcon>
      {{ action.title }}
    </VBtn>
    <VBtn
      v-if="action"
      @click="$inertia.visit(action.href)"
    >
      <VIcon v-if="action.icon">
        {{ action.icon }}
      </VIcon>
      {{ action.title }}
    </VBtn>
    <VBtn
      v-if="back"
      @click="$inertia.visit(back)"
    >
      <VIcon>mdi-arrow-left</VIcon>
      {{ $t('Back') }}
    </VBtn>
  </VAppBar>
</template>
