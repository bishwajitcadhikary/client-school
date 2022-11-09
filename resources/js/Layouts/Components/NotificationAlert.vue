<script setup>
import {usePage} from "@inertiajs/inertia-vue3"
import {inject} from "vue"

const dateFormat = inject('dateFormat')
const notifications = usePage().props.value.app.notifications
</script>

<template>
  <VBtn
    icon
    variant="text"
    color="default"
    class="me-2"
    size="small"
  >
    <VBadge
      v-if="notifications?.new > 0"
      :content="notifications?.new"
      color="error"
    >
      <VIcon
        icon="mdi-bell-ring-outline"
        size="24"
      />
    </VBadge>

    <VIcon
      v-else
      icon="mdi-bell-outline"
      size="24"
    />

    <VMenu
      activator="parent"
      location="bottom end"
    >
      <VList>
        <VListItem
          class="notification-section"
        >
          <VListItemTitle class="font-weight-bold">
            Notifications
          </VListItemTitle>

          <template #append>
            <VChip
              v-if="notifications?.new > 0"
              color="primary"
            >
              {{ $t(':count New', {count: notifications?.new}) }}
            </VChip>

            <VBtn
              variant="text"
              size="x-small"
              @click="$inertia.visit($page.props.auth.user.role === 'customer' ? route('customer.notifications.mark-all-as-read') : route('admin.notifications.mark-all-as-read'))"
            >
              {{ $t('Mark All as Read') }}
            </VBtn>
          </template>
        </VListItem>
        <VListItem
          v-for="(notification, index) in notifications?.items"
          :key="index"
          :value="index"
          :active="notification.read_at == null"
          variant="text"
          @click="notification.data.link ? $inertia.visit(route('notifications.visit', {notification: notification.id})) : ''"
        >
          <VListItemTitle class="text-sm">
            {{ notification.data?.message }}
          </VListItemTitle>
          <template #append>
            <span class="text-xs">{{ dateFormat(notification.created_at) }}</span>
          </template>
        </VListItem>
        <VListItem>
          <VBtn
            block
            class="mt-3"
            @click="$page.props.auth.user.role === 'customer' ? $inertia.visit(route('customer.notifications.index')) : $inertia.visit(route('admin.notifications.index'))"
          >
            {{ $t('See All') }}
          </VBtn>
        </VListItem>
      </VList>
    </VMenu>
  </VBtn>
</template>

<style>
.notification-section {
  padding: 14px!important;
}
</style>
