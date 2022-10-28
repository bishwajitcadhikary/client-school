<script setup>
import avatar1 from '@/assets/images/avatars/avatar-1.png'
import avatar2 from '@/assets/images/avatars/avatar-2.png'
import avatar3 from '@/assets/images/avatars/avatar-3.png'
import avatar4 from '@/assets/images/avatars/avatar-4.png'
import {ref} from "vue"
import {useForm} from "@inertiajs/inertia-vue3"
import Pagination from "@/Components/Pagination.vue"
import SettingsDrawerContent from '@/Pages/Admin/Settings/SettingsDrawerContent.vue'
import {useSnackbarStore} from "@/Stores/useSnackbarStore"

defineProps({
  roles: {
    type: Object,
    default: null,
  },
})
const snackbarStore = useSnackbarStore()
const avatars = [
  avatar1,
  avatar2,
  avatar3,
  avatar4,
]

const dialog = ref(false)
const menuRef = ref()

function destroy(id) {
  // TODO:: Hide menu
  dialog.value = false

  useForm({}).delete(route('admin.settings.roles.destroy', {role: id}), {
    onSuccess: page => snackbarStore.showNotification(page),
  })
}
</script>

<template>
  <AppLayout
    :title="$t('Roles')"
    :actions="[
      {
        title: $t('Add New'),
        href: route('admin.settings.roles.create'),
        icon: 'mdi-plus'
      }
    ]"
  >
    <template #sub-navbar>
      <SettingsDrawerContent />
    </template>
    <VContainer class="grey lighten-5">
      <VRow>
        <VCol
          v-for="(role, index) in roles.data"
          :key="index"
          cols="12"
          sm="4"
        >
          <VCard class="pa-3">
            <VCardItem>
              <VCardTitle>
                {{ role.name }}
              </VCardTitle>

              <template #append>
                <VMenu
                  ref="menuRef"
                  activator="parent"
                  location="start"
                  close-on-click
                >
                  <template #activator="{ props }">
                    <VBtn
                      icon
                      color="default"
                      size="x-small"
                      variant="text"
                      v-bind="props"
                    >
                      <VIcon
                        size="24"
                        icon="mdi-dots-vertical"
                      />
                    </VBtn>
                  </template>
                  <VList>
                    <VListItem value="1">
                      <VListItemTitle @click="$inertia.visit(route('admin.settings.roles.edit', {role: role.id}))">
                        {{ $t('Edit') }}
                      </VListItemTitle>
                    </VListItem>

                    <VListItem value="2">
                      <VListItemTitle @click="$inertia.visit(route('admin.settings.roles.assign-permission', {role: role.id}))">
                        {{ $t('Assign Permission') }}
                      </VListItemTitle>
                    </VListItem>

                    <VListItem value="3">
                      <VListItemTitle @click.stop="dialog = true">
                        {{ $t('Delete') }}
                      </VListItemTitle>
                      <VDialog
                        v-model="dialog"
                        max-width="290"
                      >
                        <VCard class="pa-3">
                          <VCardTitle class="text-h5 text-center">
                            {{ $t('Are your sure?') }}
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
                              @click.stop="destroy(role.id)"
                            >
                              {{ $t('Delete') }}
                            </VBtn>
                          </VCardActions>
                        </VCard>
                      </VDialog>
                    </VListItem>
                  </VList>
                </VMenu>
              </template>
            </VCardItem>

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
          </VCard>
        </VCol>
      </VRow>
      <Pagination :pagination="roles" />
    </VContainer>
  </AppLayout>
</template>
