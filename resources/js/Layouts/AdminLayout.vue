<script setup>
import '@/@iconify/icons-bundle'
import {loadFonts} from '@/plugins/webfontloader'
import BuyNow from '@core/components/BuyNow.vue'
import DefaultLayoutWithVerticalNav from './Components/DefaultLayoutWithVerticalNav.vue'
import {usePage} from "@inertiajs/inertia-vue3"
import {useSnackbarStore} from "@/Stores/useSnackbarStore"
import {useDeleteDialogStore} from "@/Stores/useDeleteDialogStore"
import PageHeading from "@/Components/PageHeading.vue"

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

loadFonts()

const snackbarStore = useSnackbarStore()
const dialogStore = useDeleteDialogStore()
const page = usePage()
snackbarStore.showNotification(page)
</script>

<template>
  <Head :title="title" />

  <VApp>
    <VLayout class="layout-wrapper layout-nav-type-vertical">
      <DefaultLayoutWithVerticalNav>
        <slot name="sub-navbar" />
        <PageHeading
          :title="title"
          :action="action"
          :actions="actions"
        >
          <template #actions>
            <slot name="actions" />
          </template>
        </PageHeading>

        <!-- Main Content -->
        <slot />
      </DefaultLayoutWithVerticalNav>
      <!-- <BuyNow/> -->

      <VSnackbar
        v-model="snackbarStore.isShow"
        :timeout="5000"
      >
        {{ snackbarStore.message }}

        <template #actions>
          <VBtn
            :color="snackbarStore.color"
            variant="text"
            @click="snackbarStore.hideSnackbar()"
          >
            {{ $t('Close') }}
          </VBtn>
        </template>
      </VSnackbar>

      <VDialog
        v-model="dialogStore.isShow"
        max-width="290"
      >
        <VCard class="pa-3">
          <VCardTitle class="text-h5 text-center">
            {{ $t('Are your sure to delete?') }}
          </VCardTitle>

          <VCardText class="text-center">
            <p>{{ $t('Action cannot be undone') }}</p>
          </VCardText>

          <VCardActions>
            <VSpacer />

            <VBtn
              @click="dialogStore.isShow = false"
            >
              {{ $t('Cancel') }}
            </VBtn>

            <VBtn
              color="error"
              :loading="dialogStore.loading"
              @click.stop="dialogStore.onDelete()"
            >
              {{ $t('Delete') }}
            </VBtn>
          </VCardActions>
        </VCard>
      </VDialog>
    </VLayout>
  </VApp>
</template>

<style lang="scss">
@use "@layouts/styles/default-layout";
@use '@/styles/styles';
@use '@core/scss/index';
</style>
