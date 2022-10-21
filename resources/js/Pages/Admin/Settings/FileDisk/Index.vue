<script setup>
import {ref} from "vue";
import {useForm} from "@inertiajs/inertia-vue3";
import {inject} from "vue";
const Notification = inject('Notification')

defineProps({
  disks: {
    type: Object,
    default: null
  }
})

const dialog = ref(false)
let deletableId = ref(null)
function destroy() {
  dialog.value = false;
  useForm({}).delete(route('admin.settings.file-disks.destroy', {file_disk: deletableId?.value}), {
    onSuccess: (page) => {
      if (page.props.flash.error){
        Notification.error(page.props.flash.error)
      }
      if (page.props.flash.success){
        Notification.success(page.props.flash.success)
      }
    }
  })
}
</script>

<template>
  <AdminLayout
    :title="$t('File Disks')"
    :action="{
      title: $t('Add New'),
      href: route('admin.settings.file-disks.create'),
      icon: 'mdi-plus'
    }"
  >
    <v-container>
      <v-row justify="center">
        <v-col cols="12" sm="8">
          <v-card>
            <v-card-text>
              <v-table>
                <template v-slot:default>
                  <thead>
                  <tr>
                    <th>{{ $t('Disk Name') }}</th>
                    <th>{{ $t('Filesystem Driver') }}</th>
                    <th>{{ $t('Type') }}</th>
                    <th>{{ $t('Is Default') }}</th>
                    <th></th>
                  </tr>
                  </thead>
                  <tbody>
                  <tr v-for="(disk, index) in disks.data">
                    <td>{{ disk.name }}</td>
                    <td>{{ disk.driver }}</td>
                    <td>{{ disk.type }}</td>
                    <td>
                      <v-icon :icon="disk.set_as_default ? 'mdi-check' : 'mdi-alpha-x'" :color="disk.set_as_default ? 'success' : 'error'"></v-icon>
                    </td>
                    <td class="pa-1">
                      <v-btn-toggle divided >
                        <v-btn @click="$inertia.visit(route('admin.settings.file-disks.edit', {file_disk: disk.id}))" size="small" variant="outlined" color="primary" icon="mdi-edit"/>
                        <v-btn @click.stop="dialog = true; deletableId = disk.id" size="small" variant="outlined" color="primary" icon="mdi-trash"/>
                      </v-btn-toggle>
                    </td>
                  </tr>
                  </tbody>
                </template>
              </v-table>

              <v-dialog
                v-model="dialog"
                max-width="450"
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
            </v-card-text>
          </v-card>
        </v-col>
      </v-row>
    </v-container>
  </AdminLayout>
</template>
