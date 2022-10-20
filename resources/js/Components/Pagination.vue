<script setup>
const props = defineProps({
  pagination: {
    type: Object,
    default: null
  },
})

function onChange() {
  alert('asdf')
}
</script>

<template>
  <div class="text-center" v-if="pagination.last_page > 1">
    <v-container>
      <v-row justify="center">
        <v-col cols="8">
          <v-container class="max-width">
            <v-pagination
              v-model="pagination.current_page"
              class="my-4"
              :length="pagination.last_page"
              @previous="$inertia.visit(pagination.prev_page_url)"
              @next="$inertia.visit(pagination.next_page_url)"
              @input="onChange"
            ></v-pagination>
          </v-container>
        </v-col>
      </v-row>
    </v-container>
  </div>
</template>
