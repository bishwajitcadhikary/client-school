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
const menuRef = ref()

function destroy(id) {
  // TODO:: Hide menu
  dialog.value = false;

  useForm({}).delete(route('admin.settings.roles.destroy', {role: id}), {
    onFinish: params => {

    }
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
            <v-card-item>
              <v-card-title>
                {{ role.name }}
              </v-card-title>

              <template #append>
                <v-menu activator="parent" location="start" close-on-click ref="menuRef">
                  <template v-slot:activator="{ props }">
                    <v-btn
                      icon
                      color="default"
                      size="x-small"
                      variant="text"
                      v-bind="props"
                    >
                      <v-icon
                        size="24"
                        icon="mdi-dots-vertical"
                      />
                    </v-btn>
                  </template>
                  <v-list>
                    <v-list-item value="1">
                      <v-list-item-title @click="$inertia.visit(route('admin.settings.roles.edit', {role: role.id}))">
                        {{ $t('Edit') }}
                      </v-list-item-title>
                    </v-list-item>

                    <v-list-item value="2">
                      <v-list-item-title @click="$inertia.visit(route('admin.settings.roles.assign-permission', {role: role.id}))">
                        {{ $t('Assign Permission') }}
                      </v-list-item-title>
                    </v-list-item>

                    <v-list-item value="3">
                      <v-list-item-title @click.stop="dialog = true">
                        {{ $t('Delete') }}
                      </v-list-item-title>
                      <v-dialog
                        v-model="dialog"
                        max-width="290"
                      >
                        <v-card class="pa-3">
                          <v-card-title class="text-h5 text-center">
                            {{ $t('Are your sure?') }}
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
                              @click.stop="destroy(role.id)"
                            >
                              {{ $t('Delete') }}
                            </v-btn>
                          </v-card-actions>
                        </v-card>
                      </v-dialog>
                    </v-list-item>
                  </v-list>
                </v-menu>
              </template>
            </v-card-item>

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
            </VCardText>
          </v-card>
        </v-col>
      </v-row>
      <Pagination :pagination="roles"></Pagination>
    </v-container>
  </AdminLayout>
</template>
