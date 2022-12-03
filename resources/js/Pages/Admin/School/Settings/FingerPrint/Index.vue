<script setup>
import DrawerContent from '../DrawerContent.vue'
import DataNotFound from "@/Components/DataNotFound.vue"
import Pagination from "@/Components/Pagination.vue"
import {useDeleteDialogStore} from "@/Stores/useDeleteDialogStore"

const props = defineProps({
  school: {
    type: Object,
    required: true,
  },
  devices: {
    type: Object,
    required: true,
  },
})
</script>

<template>
  <AppLayout
    :title="$t('Fingerprint Devices')"
    :action="{
      title: $t('Add Device'),
      href: route('admin.schools.settings.fingerprint-devices.create', school.id),
      icon: 'mdi-plus',
    }"
  >
    <template #sub-navbar>
      <DrawerContent :school="school" />
    </template>

    <VCard>
      <VTable v-if="devices.data.length">
        <thead>
          <tr>
            <th>{{ $t('Name') }}</th>
            <th>{{ $t('Device ID') }}</th>
            <th>{{ $t('Auth Code') }}</th>
            <th>{{ $t('Auth User') }}</th>
            <th>{{ $t('Status') }}</th>
            <th>{{ $t('Action') }}</th>
          </tr>
        </thead>
        <tbody>
          <tr
            v-for="device in devices.data"
            :key="device.id"
          >
            <td>{{ device.name }}</td>
            <td>{{ device.device_id }}</td>
            <td>{{ device.auth_code }}</td>
            <td>{{ device.auth_user }}</td>
            <td>
              <VChip :color="!!device.is_active ? 'success' : 'error'">
                <VIcon>
                  {{ !!device.is_active ? 'mdi-check' : 'mdi-close' }}
                </VIcon>
                {{ device.status ? $t('Active') : $t('Inactive') }}
              </VChip>
            </td>
            <td>
              <VTooltip :text="$t('Edit Device')">
                <template #activator="{ props }">
                  <VBtn
                    variant="plain"
                    size="small"
                    icon="mdi-clipboard-edit-outline"
                    v-bind="props"
                    @click="$inertia.visit(route('admin.schools.settings.fingerprint-devices.edit', {school: school.id, fingerprint_device: device.id}))"
                  />
                </template>
              </VTooltip>
              <VTooltip
                :text="$t('Delete Device')"
              >
                <template #activator="{props}">
                  <VBtn
                    variant="plain"
                    size="small"
                    icon="mdi-delete-outline"
                    color="error"
                    v-bind="props"
                    @click="useDeleteDialogStore().showDialog(route('admin.schools.settings.fingerprint-devices.destroy', {school: school.id, fingerprint_device: device.id}))"
                  />
                </template>
              </VTooltip>
            </td>
          </tr>
        </tbody>
      </VTable>

      <VCardText>
        <DataNotFound v-if="!!!devices.data.length" />

        <Pagination :pagination="devices" />
      </VCardText>
    </VCard>
  </AppLayout>
</template>
