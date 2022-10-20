<script setup>
import {useForm} from "@inertiajs/inertia-vue3";
import {computed} from "vue";

const props = defineProps({
  role: {
    type: Object,
    required: true
  },
  groups: {
    type: Array,
    default: null
  },
  permissionIds: {
    type: Array,
    default: null
  }
})

const form = useForm({
  select_all: false,
  permissions: [...props.permissionIds],
  name: null
})

function selectAll() {
  for (const i in form.permissions) {
    form.permissions[i] = form.select_all
  }
}

function submit() {
  form.put(route('admin.settings.roles.assign-permission-update', {role: props.role.id}), {
    onSuccess: (page) => {
      console.log(page)
    }
  })
}
</script>

<template>
  <AdminLayout :title="$t('Assign Permissions')" :back="route('admin.settings.roles.index')">
    <v-container>
      <v-row justify="center">
        <v-col cols="12" sm="8">
          <v-card class="pa-2">
            <v-card-title>{{ role.name }}</v-card-title>
            <v-card-text>
              <v-form @submit.prevent="submit">
                <v-col
                  cols="12"
                >
                  <v-table>
                    <template v-slot:default>
                      <tbody>
                      <tr>
                        <th>{{ $t('Administrative Access') }}</th>
                        <td>
                          <v-checkbox
                            v-model="form.select_all"
                            :label="$t('Select All')"
                            @click.native.stop="selectAll"
                          />
                        </td>
                      </tr>
                      <tr
                        v-for="(group, permissionName) in groups"
                      >
                        <th>{{ permissionName }}</th>
                        <td class="d-flex gap-5">
                          <v-checkbox
                            class="mr-2"
                            ref="checkboxes"
                            v-for="(permission) in group"
                            v-model="form.permissions"
                            :value="permission.id"
                            :label="permission.name.replace('-', ' ').replace(permissionName.toLowerCase(), '')"
                            @click.native.stop
                          />
                        </td>
                      </tr>
                      </tbody>
                    </template>
                  </v-table>
                </v-col>

                <v-col cols="12">
                  <v-btn
                    :loading="form.processing"
                    type="submit"
                    block
                  >
                    {{ $t('Submit') }}
                  </v-btn>
                </v-col>
              </v-form>
            </v-card-text>
          </v-card>
        </v-col>
      </v-row>
    </v-container>
  </AdminLayout>
</template>
