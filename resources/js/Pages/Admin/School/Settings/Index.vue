<script setup>
import DrawerContent from './DrawerContent.vue'
import {useForm} from "@inertiajs/inertia-vue3"
import {computed, ref} from "vue"
import Datepicker from '@vuepic/vue-datepicker'
import '@vuepic/vue-datepicker/dist/main.css'
import {useSnackbarStore} from "@/Stores/useSnackbarStore"

const props = defineProps({
  school: {
    type: Object,
    required: true,
  },
  setting: {
    type: Object,
    default: null,
  },
  schoolYears: {
    type: Object,
    default: null
  }
})

const form = useForm({
  _method: 'PUT',
  school_year: props.setting?.school_year,
  attendance_update_at: props.setting?.attendance_update_at,
  late_time: props.setting?.late_time,
  absent_time: props.setting?.absent_time,
  weekends: props.setting?.weekends || [],
  holidays: props.setting?.holidays || null,
})

const weekends = ref([
  {value: 'sunday', title: 'Sunday'},
  {value: 'monday', title: 'Monday'},
  {value: 'tuesday', title: 'Tuesday'},
  {value: 'wednesday', title: 'Wednesday'},
  {value: 'thursday', title: 'Thursday'},
  {value: 'friday', title: 'Friday'},
  {value: 'saturday', title: 'Saturday'},
])

const submit = () => {
  form.post(route('admin.schools.settings.update', props.school.id), {
    preserveScroll: true,
    preserveState: true,
    onSuccess: page => useSnackbarStore().showNotification(page),
  })
}
</script>

<template>
  <AppLayout :title="$t('Finger Print Setting')">
    <template #sub-navbar>
      <DrawerContent :school="school" />
    </template>

    <VCard>
      <VCardItem>
        <VAlert
          type="warning"
          variant="outlined"
          class="mb-4"
        >
          {{ $t('Changes will be applied at 12:00 AM') }}
        </VAlert>
      </VCardItem>
      <VCardText>
        <VForm @submit.prevent="submit">
          <VRow>
            <VCol
              cols="12"
              md="6"
            >
              <VAutocomplete
                v-model="form.school_year"
                :label="$t('Current School Year')"
                :error-messages="form.errors.school_year"
                :items="schoolYears"
              />
            </VCol>

            <VCol
              cols="12"
              md="6"
            >
              <VTextField
                v-model="form.attendance_update_at"
                :label="$t('Attendance Update At')"
                :error-messages="form.errors.attendance_update_at"
                type="time"
              />
            </VCol>

            <VCol
              cols="12"
              md="6"
            >
              <VTextField
                v-model="form.late_time"
                :label="$t('Late Time')"
                :error-messages="form.errors.late_time"
                type="time"
              />
            </VCol>

            <VCol
              cols="12"
              md="6"
            >
              <VTextField
                v-model="form.absent_time"
                :label="$t('Absent Time')"
                :error-messages="form.errors.absent_time"
                type="time"
              />
            </VCol>

            <VCol
              cols="12"
              md="6"
            >
              <VAutocomplete
                v-model="form.weekends"
                :label="$t('Weekends')"
                :items="weekends"
                :error-messages="form.errors.weekends"
                multiple
                chips
              />
            </VCol>

          </VRow>
          <VRow>
            <VCol
              cols="12"
              md="6"
            >
              <VLabel>
                {{ $t('Holidays') }}
              </VLabel>
              <Datepicker
                v-model="form.holidays"
                inline
                auto-apply
                multi-dates
                :enable-time-picker="false"
                format="MM/dd/yyyy"
                class="mt-5"
              />
              <p class="text-error">
                {{ form.errors.holidays }}
              </p>
            </VCol>

            <VCol cols="12">
              <VBtn
                type="submit"
                :loading="form.processing"
                prepend-icon="mdi-content-save"
              >
                {{ $t('Save') }}
              </VBtn>
            </VCol>
          </VRow>
        </VForm>
      </VCardText>
    </VCard>
  </AppLayout>
</template>
