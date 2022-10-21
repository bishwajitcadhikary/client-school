<script setup>
import {ref} from "vue";

const props = defineProps({
  button: {
    type: String,
    required: true
  },
  title: {
    type: String,
    required: false
  }
})

const dialog = ref(false)

</script>

<template>
  <v-dialog
    v-model="dialog"
    max-width="30%"
  >
    <template v-slot:activator="{ props }">
      <v-btn
        color="primary"
        v-bind="props"
      >
        {{ button }}
      </v-btn>
    </template>
    <v-card>
      <v-card-title class="text-h5" v-if="title">
        {{ title }}
      </v-card-title>

      <slot></slot>
    </v-card>
  </v-dialog>
</template>
