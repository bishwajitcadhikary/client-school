<script setup>
import {Inertia} from "@inertiajs/inertia"

const props = defineProps({
  pagination: {
    type: Object,
    default: null,
  },
})

const current_page = ref(props.pagination.current_page)

function selectPage(page) {
  Inertia.get(props.pagination.path, {page}, {
    preserveScroll: true,
    preserveState: true,
  })
}
</script>

<template>
  <div
    v-if="pagination.last_page > 1"
    class="text-center"
  >
    <VContainer>
      <VRow justify="center">
        <VCol cols="8">
          <VContainer class="max-width">
            <VPagination
              v-model="current_page"
              class="my-4"
              :length="pagination.last_page"
              @prev="$inertia.visit(pagination.prev_page_url)"
              @next="$inertia.visit(pagination.next_page_url)"
              @update:modelValue="selectPage"
            />
          </VContainer>
        </VCol>
      </VRow>
    </VContainer>
  </div>
</template>
