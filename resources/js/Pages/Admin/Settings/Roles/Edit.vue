<script setup>
import {useForm} from "@inertiajs/inertia-vue3";

const props = defineProps({
  role: {
    type: Object,
    required: true
  }
})

const form = useForm({
  name: props.role.name
})

function submit() {
  form.put(route('admin.settings.roles.update', {role: props.role.id}))
}
</script>

<template>
  <AdminLayout :title="$t('Edit Role')" :back="route('admin.settings.roles.index')">
    <v-container>
      <v-row justify="center">
        <v-col cols="12" sm="6">
          <v-card>
            <v-card-text>
              <v-form @submit.prevent="submit">
                <v-col
                  cols="12"
                >
                  <v-text-field
                    v-model="form.name"
                    :label="$t('Name')"
                    :error-messages="form.errors.name"
                    outlined
                    dense
                  />
                </v-col>

                <v-col cols="12">
                  <v-btn
                    :loading="form.processing"
                    type="submit"
                    block
                  >
                    <v-icon>mdi-content-save</v-icon>
                    {{ $t('Submit') }}
                  </v-btn>
                </v-col>
              </v-form>
            </v-card-text>
          </v-card>
        </v-col>
      </v-row>
    </v-container>
  </AdminLayout>
</template>
