<script setup>
import {ref} from 'vue'
import {trans} from "laravel-vue-i18n"
import {useForm} from "@inertiajs/inertia-vue3"
import {useSnackbarStore} from "@/Stores/useSnackbarStore"

const props = defineProps({
  school: {
    type: Object,
    required: true,
    default: null,
  },
})
const showPassword = ref(false)
const domain = `https://${props.school.domain}`
const isPinged = ref(true)
const showChangeStatusDialog = ref(false)

const checkPing = () => {
  let req = new Request(domain, {
    method: "get",
  })

  fetch(req, {mode: "no-cors"})
    .then(response => {
      if (response.status !== 404) {
        isPinged.value = true
      }
    })
    .catch(error => {
      isPinged.value = false
    })
}
checkPing()

const changeWebsiteStatus = () => {
  useForm({
    _method: 'PUT',
  }).post(route('admin.schools.change-status', {school: props.school.id}),{
    preserveState: true,
    preserveScroll: true,
    only: ['school'],
    onSuccess: page => useSnackbarStore().showNotification(page),
    onFinish: page => {
      showChangeStatusDialog.value = false
    },
  })
}
</script>

<template>
  <AppLayout
    :title="school.name"
    :back="route('admin.schools.index')"
  >
    <VContainer>
      <VRow>
        <VCol
          cols="12"
          lg="4"
          md="5"
        >
          <VRow>
            <VCol cols="12">
              <VCard>
                <VCardItem>
                  <VCardTitle>{{ $t('Database Credentials') }}</VCardTitle>
                </VCardItem>
                <VCardText>
                  <VList>
                    <VListItem>
                      <VListItemSubtitle>
                        <h6 class="text-sm">
                          {{ $t('School:') }}
                          <span class="text-body-2">{{ school.name }}</span>
                        </h6>
                      </VListItemSubtitle>
                    </VListItem>
                    <VListItem>
                      <VListItemSubtitle>
                        <h6 class="text-sm">
                          {{ $t('HOST:') }}
                          <span class="text-body-2">{{ school.host }}</span>
                        </h6>
                      </VListItemSubtitle>
                    </VListItem>
                    <VListItem>
                      <VListItemSubtitle>
                        <h6 class="text-sm">
                          {{ $t('PORT:') }}
                          <span class="text-body-2">{{ school.port }}</span>
                        </h6>
                      </VListItemSubtitle>
                    </VListItem>
                    <VListItem>
                      <VListItemSubtitle>
                        <h6 class="text-sm">
                          {{ $t('USERNAME:') }}
                          <span class="text-body-2">{{ school.username }}</span>
                        </h6>
                      </VListItemSubtitle>
                    </VListItem>
                    <VListItem>
                      <VListItemSubtitle>
                        <h6 class="text-sm">
                          {{ $t('PASSWORD:') }}
                          <span class="text-body-2">
                            {{ showPassword ? school.password : '*********' }}
                          </span>

                          <VBtn
                            variant="plain"
                            @click="showPassword = !showPassword"
                          >
                            <VIcon>{{ showPassword ? 'mdi-eye-off' : 'mdi-eye' }}</VIcon>
                          </VBtn>
                        </h6>
                      </VListItemSubtitle>
                    </VListItem>
                    <VListItem>
                      <VListItemSubtitle>
                        <h6 class="text-sm">
                          {{ $t('DATABASE:') }}
                          <span class="text-body-2">{{ school.database }}</span>
                        </h6>
                      </VListItemSubtitle>
                    </VListItem>
                    <VListItem>
                      <VListItemSubtitle>
                        <h6 class="text-sm">
                          {{ $t('DOMAIN:') }}
                          <span class="text-body-2">
                            <a
                              :href="'http://'+school.domain"
                              target="_blank"
                            >
                              {{ school.domain }}
                            </a>
                          </span>
                        </h6>
                      </VListItemSubtitle>
                    </VListItem>
                    <VListItem>
                      <VListItemSubtitle>
                        <h6 class="text-sm">
                          {{ $t('STATUS:') }}

                          <VChip
                            v-if="!!school.is_active"
                            color="primary"
                          >
                            {{ $t('Active') }}
                            <VIcon
                              class="ml-2"
                              icon="mdi-check"
                            />
                          </VChip>
                          <VChip
                            v-else
                            color="error"
                          >
                            {{ $t('Inactive') }}

                            <VIcon
                              class="ml-2"
                              icon="mdi-close"
                            />
                          </VChip>
                        </h6>
                      </VListItemSubtitle>
                    </VListItem>
                  </VList>
                </VCardText>
                <VCardText class="d-flex justify-center">
                  <VBtn
                    class="me-3"
                    @click="$inertia.visit(route('admin.schools.edit', {school: school.id}))"
                  >
                    {{ $t('Edit') }}
                  </VBtn>
                  <VBtn
                    :color="!!school.is_active ? 'error' : 'primary'"
                    @click="showChangeStatusDialog = true"
                  >
                    {{ !!school.is_active ? $t('Deactivate') : $t('Activate') }}

                    <VIcon>{{ !!school.is_active ? 'mdi-arrow-down' : 'mdi-arrow-up' }}</VIcon>
                  </VBtn>
                </VCardText>
              </VCard>
            </VCol>
          </VRow>
        </VCol>

        <VCol>
          <VCard v-if="isPinged">
            <VCardText>
              <iframe
                :src="domain"
                frameborder="0"
                width="100%"
                height="420"
              />
            </VCardText>

            <VOverlay
              :model-value="!isPinged"
              class="align-center justify-center text-center"
              contained
            >
              <VProgressCircular
                size="64"
                color="primary"
                indeterminate
              />
            </VOverlay>
          </VCard>
          <VRow
            v-else
            justify="center"
          >
            <VCol
              cols="12"
              md="6"
            >
              <VCard>
                <VCardText
                  class="d-flex justify-center align-center"
                >
                  <VAvatar
                    class="text-primary mb-4"
                    variant="tonal"
                  >
                    <VIcon>mdi-server</VIcon>
                  </VAvatar>
                </VCardText>
                <VCardText class="text-center">
                  <VCol cols="12">
                    {{ $t('Site is not reachable. Maybe it is down or site deployment is taking time. Please try again later.') }}
                  </VCol>

                  <VCol cols="12">
                    <VBtn @click="checkPing">
                      <VIcon>mdi-refresh</VIcon>
                      {{ $t('Refresh') }}
                    </VBtn>
                  </VCol>
                </VCardText>
              </VCard>
            </VCol>
          </VRow>
        </VCol>
      </VRow>
    </VContainer>
  </AppLayout>

  <VDialog
    v-model="showChangeStatusDialog"
    persistent
    max-width="30%"
  >
    <VCard>
      <VCardItem>
        <VCardTitle>
          {{ $t('Are you sure to :status the school', {status: !!school.is_active ? trans('deactivate') : trans('activate')}) }}
        </VCardTitle>
      </VCardItem>
      <VCardText v-if="school.is_active">
        {{ $t('Website will be deactivated') }}
      </VCardText>
      <VCardText v-if="!school.is_active">
        {{ $t('After activation website will be live') }}
      </VCardText>
      <VCardActions>
        <VSpacer />
        <VBtn
          color="primary"
          text
          @click="showChangeStatusDialog = false"
        >
          {{ $t('Cancel') }}
        </VBtn>
        <VBtn
          color="error"
          text
          @click="changeWebsiteStatus"
        >
          {{ !!school.is_active ? $t('Deactivate') : $t('Activate') }}
        </VBtn>
      </VCardActions>
    </VCard>
  </VDialog>
</template>
