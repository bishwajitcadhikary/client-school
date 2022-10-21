<script setup>
import {ref} from "vue";
import {useForm} from "@inertiajs/inertia-vue3";
import {inject} from "vue";
const Notification = inject('Notification')

defineProps({
  backups: {
    type: Object,
    default: null
  }
})

const dialog = ref(false)
let deletableId = ref(null)
function destroy() {
  dialog.value = false;
  useForm({}).delete(route('admin.settings.backups.destroy', {file_disk: deletableId?.value}), {
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
    :title="$t('Backups')"
    :action="{
      title: $t('Add New'),
      href: route('admin.settings.backups.create'),
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
                    <th>{{ $t('Path') }}</th>
                    <th>{{ $t('Size') }}</th>
                    <th>{{ $t('Created At') }}</th>
                    <th></th>
                  </tr>
                  </thead>
                  <tbody>
                  <tr v-for="(backup, index) in backups.data">
                    <td>{{ backup.path }}</td>
                    <td>{{ backup.size }}</td>
                    <td>{{ backup.created_at }}</td>
                    <td class="pa-1">
                      <v-btn-toggle divided >
                        <v-btn @click="$inertia.visit(route('admin.settings.backups.edit', {file_disk: backup.id}))" size="small" variant="outlined" color="primary" icon="mdi-edit"/>
                        <v-btn @click.stop="dialog = true; deletableId = backup.id" size="small" variant="outlined" color="primary" icon="mdi-trash"/>
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
