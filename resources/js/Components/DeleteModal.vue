<template>
  <v-dialog
    v-model="dialog"
    max-width="290"
  >
    <v-card class="pa-3">
      <v-card-title class="text-h5 text-center">
        {{ $t('Are your sure to delete?') }}
      </v-card-title>

      <v-card-text class="text-center">
        <p>{{ $t('Action cannot be undone') }}</p>
      </v-card-text>

      <v-card-actions>
        <v-spacer></v-spacer>

        <v-btn
          @click="dialog = false"
        >
          {{ $t('Cancel') }}
        </v-btn>

        <v-btn
          color="error"
          @click.stop="destroy"
        >
          {{ $t('Delete') }}
        </v-btn>
      </v-card-actions>
    </v-card>
  </v-dialog>
</template>
