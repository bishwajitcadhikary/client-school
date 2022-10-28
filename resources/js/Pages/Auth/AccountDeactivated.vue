<script setup>
import logo from '@/assets/logo.svg?raw'
</script>

<template>
  <Head :title="$t('Account Deactivated')" />
  <div class="auth-wrapper d-flex align-center justify-center pa-4">
    <VCard
      class="auth-card pa-4 pt-7"
      max-width="448"
    >
      <VCardItem class="justify-center">
        <template #prepend>
          <div class="d-flex">
            <div v-html="logo" />
          </div>
        </template>

        <VCardTitle class="font-weight-semibold text-2xl text-uppercase">
          {{ $page.props.app.name }}
        </VCardTitle>
      </VCardItem>

      <VCardText class="pt-2">
        <h5 class="text-h5 font-weight-semibold mb-1 text-center">
          {{ $t('Account Deactivated') }}
        </h5>
        <p class="mb-0">
          {{ $t("We are sorry to say that, your account has been deactivated") }}
        </p>
      </VCardText>

      <VCardText class="text-center">
        <VBtn @click="$inertia.visit('/contact')">
          {{ $t('Contact Us') }}
        </VBtn>
      </VCardText>
    </VCard>
  </div>
</template>

<style lang="scss">
@use "@core/scss/pages/page-auth.scss";
</style>
