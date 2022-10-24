<script setup>
import '@/@iconify/icons-bundle'
import {loadFonts} from '@/plugins/webfontloader'

defineProps({
  title: {
    type: String,
    required: false,
  },
  action: {
    type: Object,
    required: false,
  },
  actions: {
    type: Array,
    required: false,
  },
  back: {
    type: String,
    required: false,
  },
})

loadFonts()

import BuyNow from '@core/components/BuyNow.vue'
import DefaultLayoutWithVerticalNav from './Components/DefaultLayoutWithVerticalNav.vue'
import {inject, onMounted} from "vue"
import {usePage} from "@inertiajs/inertia-vue3"

const flash = usePage().props.value.flash
const Notification = inject('Notification')

onMounted(() => {
  if (flash.success){
    Notification.success(flash.success)
  }
  if (flash.error){
    Notification.error(flash.error)
  }
})
</script>

<template>
  <Head
    v-if="title"
    :title="title"
  />
  <VApp>
    <VLayout class="layout-wrapper layout-nav-type-vertical">
      <DefaultLayoutWithVerticalNav>
        <VContainer v-if="title || actions">
          <div class="d-flex justify-space-between align-center">
            <h3>{{ title }}</h3>

            <slot name="actions">
              <Link
                v-for="(action, index) in actions"
                v-if="actions"
                :key="index"
                :href="action.href"
              >
                <VBtn>
                  <VIcon v-if="action.icon">
                    {{ action.icon }}
                  </VIcon>
                  {{ action.title }}
                </VBtn>
              </Link>
              <Link
                v-if="action"
                :href="action.href"
              >
                <VBtn>
                  <VIcon
                    v-if="action.icon"
                    class="mr-2"
                  >
                    {{ action.icon }}
                  </VIcon>
                  {{ action.title }}
                </VBtn>
              </Link>
              <Link
                v-if="back"
                :href="back"
              >
                <VBtn>
                  <VIcon
                    class="mr-2"
                    icon="mdi-arrow-left"
                  />

                  {{ $t('Back') }}
                </VBtn>
              </Link>
            </slot>
          </div>
        </VContainer>

        <slot name="sub-navbar" />
        <slot />
      </DefaultLayoutWithVerticalNav>
      <!--      <BuyNow/> -->
    </VLayout>
  </VApp>
</template>

<style lang="scss">
@use "@layouts/styles/default-layout";
@use '@/styles/styles';
@use '@core/scss/index';
</style>
