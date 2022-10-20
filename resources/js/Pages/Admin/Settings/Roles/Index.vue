<script setup>
import avatar1 from '@/assets/images/avatars/avatar-1.png'
import avatar2 from '@/assets/images/avatars/avatar-2.png'
import avatar3 from '@/assets/images/avatars/avatar-3.png'
import avatar4 from '@/assets/images/avatars/avatar-4.png'
import {ref} from "vue";
import {useForm} from "@inertiajs/inertia-vue3";
import Pagination from "@/Components/Pagination.vue";

const avatars = [
  avatar1,
  avatar2,
  avatar3,
  avatar4,
]

defineProps({
  roles: {
    type: Object,
    default: null
  }
})

const dialog = ref(false)

function destroy(id) {
  dialog.value = false;

  useForm({}).delete(route('admin.settings.roles.destroy', {role: id}), {
    preserveScroll: true,
    preserveState: true,
  })
}

</script>

<template>
  <AdminLayout
    :title="$t('Roles')"
    :actions="[
      {
        title: $t('Add New'),
        href: route('admin.settings.roles.create'),
        icon: 'mdi-plus'
      }
    ]"
  >
    <v-container class="grey lighten-5">
      <v-row>
        <v-col
          v-for="(role, index) in roles.data"
          :key="index"
          cols="12"
          sm="4"
        >
          <v-card class="pa-3">

            <v-card-title>
              {{ role.name }}
            </v-card-title>
            <VCardText class="position-relative">
              <div class="d-flex justify-space-between align-center">
                <span class="font-weight-medium">{{ $t(':count users', {count: 10}) }}</span>

                <div class="v-avatar-group">
                  <VAvatar
                    v-for="avatar in avatars"
                    :key="avatar"
                    :image="avatar"
                    size="45"
                  />
                </div>
              </div>

              <div class="d-flex justify-space-between mt-3">
                <Link :href="route('admin.settings.roles.edit', {role: role.id})" class="text-sm">
                  <v-icon size="sm">mdi-edit</v-icon>
                  {{ $t('Edit Role') }}
                </Link>

                <v-icon @click.stop="dialog = true" color="error">mdi-trash</v-icon>

                <v-dialog
                  v-model="dialog"
                  max-width="290"
                >
                  <v-card class="pa-3">
                    <v-card-title class="text-h5 text-center">
                      Are your sure?
                    </v-card-title>

                    <v-card-text class="text-center">
                      <v-icon>mdi-trash</v-icon>
                      <p>Action cannot be undone</p>
                    </v-card-text>

                    <v-card-actions>
                      <v-spacer></v-spacer>

                      <v-btn
                        color="green darken-1"
                        text
                        @click="dialog = false"
                      >
                        {{ $t('Cancel') }}
                      </v-btn>

                      <v-btn
                        color="green darken-1"
                        text
                        @click="destroy(role.id)"
                      >
                        {{ $t('Delete') }}
                      </v-btn>
                    </v-card-actions>
                  </v-card>
                </v-dialog>
              </div>
            </VCardText>
          </v-card>
        </v-col>
      </v-row>
      <Pagination :pagination="roles"></Pagination>
    </v-container>
  </AdminLayout>
</template>
