<template>
  <VDialog
    v-model="dialog"
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
          @click="dialog = false"
        >
          {{ $t('Cancel') }}
        </VBtn>

        <VBtn
          color="error"
          @click.stop="destroy"
        >
          {{ $t('Delete') }}
        </VBtn>
      </VCardActions>
    </VCard>
  </VDialog>
</template>
