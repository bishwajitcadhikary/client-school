<script setup>
import {Inertia} from '@inertiajs/inertia'

const props = defineProps({
  'pagination': Object
})
</script>

<template>
  <div class="text-center">
    <v-container>
      <v-row justify="center">
        <v-col cols="8">
          <v-container class="max-width">
            {{ pagination.prev_page_url }}
            <v-pagination
              v-model="pagination.current_page"
              class="my-4"
              :length="pagination.last_page"
              @next="$inertia.visit(pagination.next_page_url)"
              @previous="() => {alert('asdf')}"
            ></v-pagination>
          </v-container>
        </v-col>
      </v-row>
    </v-container>
  </div>
</template>
