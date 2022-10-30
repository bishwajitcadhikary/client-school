<script setup>
import {inject} from "vue"


defineProps({
  notifications: {
    type: Object,
    default: null,
  },
})

const dateFormat = inject('dateFormat')
</script>

<template>
  <AppLayout :title="$t('Notifications')">
    <VContainer>
      <VRow justify="center">
        <VCol
          cols="12"
          md="8"
        >
          <VCard>
            <VCardText>
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
          </VCard>
        </VCol>
      </VRow>
    </VContainer>
  </AppLayout>
</template>
