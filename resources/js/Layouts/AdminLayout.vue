<script setup>
import '@/@iconify/icons-bundle'
import {loadFonts} from '@/plugins/webfontloader'

loadFonts()

import BuyNow from '@core/components/BuyNow.vue'
import DefaultLayoutWithVerticalNav from './Components/DefaultLayoutWithVerticalNav.vue'
import {inject, onMounted} from "vue";
import {usePage} from "@inertiajs/inertia-vue3";

const flash = usePage().props.value.flash;
const Notification = inject('Notification')

defineProps({
  title: {
    type: String,
    required: false
  },
  action: {
    type: Object,
    required: false
  },
  actions: {
    type: Array,
    required: false
  },
  back: {
    type: String,
    required: false
  }
})

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
  <Head :title="title" v-if="title"></Head>
  <VApp>
    <VLayout class="layout-wrapper layout-nav-type-vertical">
      <DefaultLayoutWithVerticalNav>
        <v-container v-if="title || actions">
          <div class="d-flex justify-space-between align-center">
            <h3>{{ title }}</h3>

            <div>
              <Link v-if="actions" v-for="(action, index) in actions" :href="action.href" :key="index">
                <v-btn>
                  <v-icon v-if="action.icon">{{ action.icon }}</v-icon>
                  {{ action.title }}
                </v-btn>
              </Link>
              <Link v-if="action" :href="action.href">
                <v-btn>
                  <v-icon class="mr-2" v-if="action.icon">{{ action.icon }}</v-icon>
                  {{ action.title }}
                </v-btn>
              </Link>
              <Link v-if="back" :href="back">
                <v-btn>
                  <v-icon class="mr-2">mdi-arrow-left-bold</v-icon>
                  {{ $t('Back') }}
                </v-btn>
              </Link>
            </div>
          </div>
        </v-container>

        <slot></slot>
      </DefaultLayoutWithVerticalNav>
<!--      <BuyNow/>-->
    </VLayout>
  </VApp>
</template>

<style lang="scss">
@use "@layouts/styles/default-layout";
@use '@/styles/styles';
@use '@core/scss/index';
</style>
