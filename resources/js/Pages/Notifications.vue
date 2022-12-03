<script setup>
import {inject} from "vue"
import DataNotFound from "@/Components/DataNotFound.vue"
import Pagination from "@/Components/Pagination.vue"
import {useForm} from "@inertiajs/inertia-vue3"
import {useSnackbarStore} from "@/Stores/useSnackbarStore"


defineProps({
  notifications: {
    type: Object,
    default: null,
  },
})

const dateFormat = inject('dateFormat')

const form = useForm({

})
const markAllAsRead = () => {
  form.post(route('customer.notifications.mark-all-as-read'), {
    preserveScroll: true,
    preserveState: true,
    onSuccess: page => useSnackbarStore().showNotification(page),
  })
}
</script>

<template>
  <AppLayout :title="$t('Notifications')">
    <template #actions>
      <VBtn
        color="primary"
        :loading="form.processing"
        @click="markAllAsRead"
      >
        {{ $t('Mark all as read') }}
      </VBtn>
    </template>

    <VContainer>
      <VRow justify="center">
        <VCol
          cols="12"
          md="8"
        >
          <VCard>
            <VCardText v-if="notifications.data.length">
              <VList>
                <VListItem
                  v-for="notification in notifications.data"
                  :key="notification.id"
                  :value="notification.id"
                  class="border border-b-0"
                  :prepend-icon="notification.read_at ? 'mdi-bell-outline' : 'mdi-bell-ring'"
                  @click="notification.data.link ? $inertia.visit(route('notifications.visit', {notification: notification.id})) : ''"
                >
                  <VListItemTitle>
                    {{ notification.data.message }}
                  </VListItemTitle>

                  <template #append>
                    {{ dateFormat(notification.created_at) }}
                  </template>
                </VListItem>
              </VList>
            </VCardText>

            <VCardText>
              <DataNotFound v-if="!!!notifications.data.length" />

              <Pagination :pagination="notifications" />
            </VCardText>
          </VCard>
        </VCol>
      </VRow>
    </VContainer>
  </AppLayout>
</template>
