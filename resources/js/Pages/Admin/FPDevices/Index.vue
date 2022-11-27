<script setup>
import {inject} from "vue"
import {useForm} from "@inertiajs/inertia-vue3"
import {useSnackbarStore} from "@/Stores/useSnackbarStore"
import Pagination from "@/Components/Pagination.vue"

const props = defineProps({
  devices: {
    type: Object,
    default: null,
  },
})

const dateFormat = inject('dateFormat')

const syncDeviceForm = useForm({})
const syncDevices = () => {
  syncDeviceForm.post(route('admin.finger-prints.sync-devices'), {
    preserveScroll: true,
    preserveState: true,
    onSuccess: page => {
      useSnackbarStore().showNotification(page)
    },
  })
}
</script>

<template>
  <AppLayout :title="$t('Fingerprint')">
    <template #actions>
      <VBtn
        color="primary"
        prepend-icon="mdi-sync"
        :loading="syncDeviceForm.processing"
        @click="syncDevices"
      >
        {{ $t('Sync') }}
      </VBtn>
    </template>
    <VRow>
      <VCol
        cols="12"
        md="6"
        lg="4"
      >
        <VCard>
          <VToolbar
            color="rgba(0, 0, 0, 0)"
            theme="dark"
          >
            <VToolbarTitle
              color="primary"
              :dark="false"
            >
              {{ $t('Devices') }}
            </VToolbarTitle>

            <template #append>
              <VBtn
                color="primary"
                prepend-icon="mdi-sync"
                :loading="syncDeviceForm.processing"
                block
                variant="contained"
                @click="syncDevices"
              >
                {{ $t('Sync') }}
              </VBtn>
            </template>
          </VToolbar>
          <VTable>
            <thead>
              <tr>
                <th>{{ $t("Device Name") }}</th>
                <th>{{ $t("Device ID") }}</th>
                <th>{{ $t("Last Connected At") }}</th>
              </tr>
            </thead>
            <tbody>
              <tr
                v-for="device in devices.data"
                :key="device.id"
              >
                <td>{{ device.name }}</td>
                <td>{{ device.device_id }}</td>
                <td>{{ dateFormat(device.last_connected, 'YYYY-MM-DD h:mm A') }}</td>
              </tr>
            </tbody>
          </VTable>

          <VCardText>
            <Pagination :pagination="devices" />
          </VCardText>
        </VCard>
      </VCol>
    </VRow>
  </AppLayout>
</template>
