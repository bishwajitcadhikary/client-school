<script setup>
import {ref, inject} from 'vue'
import {useForm} from "@inertiajs/inertia-vue3"
import {trans} from "laravel-vue-i18n"
import {useSnackbarStore} from "@/Stores/useSnackbarStore"

const props = defineProps({
  customer: {
    type: Object,
    required: true,
    default: null,
  },
  expiration: {
    type: String,
    default: null,
  },
  percent: {
    type: String,
    default: null,
  },
})

const currencyFormat = inject('currencyFormat')
const tab = ref('overview')
const showPassword = ref(false)
const showConfirmPassword = ref(false)
const showSuspendDialog = ref(false)

const passwordForm = useForm({
  _method: 'PUT',
  password: null,
  password_confirmation: null,
})

const submitPasswordForm = () => {
  passwordForm.post(route('admin.customers.change-password', {customer: props.customer.id}), {
    preserveState: true,
    preserveScroll: true,
    onSuccess: page => {
      useSnackbarStore().showNotification(page)
      passwordForm.reset()
    },
  })
}

const submitSuspension = () => {
  useForm({
    _method: 'PUT',
  }).post(route('admin.customers.toggle-suspend', {customer: props.customer.id}),{
    preserveState: false,
    onSuccess: page => useSnackbarStore().showNotification(page),
    onFinish: page => {
      showSuspendDialog.value = false
    },
  })
}
</script>

<template>
  <AppLayout :title="customer.name">
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
                <VCardText class="text-center pt-15">
                  <VAvatar
                    v-if="customer.avatar"
                    rounded="sm"
                    size="120"
                    variant="tonal"
                  >
                    <VImg
                      :src="customer.avatar"
                    />
                  </VAvatar>
                  <h6 class="text-h6 mt-4">
                    {{ customer.name }}
                  </h6>
                </VCardText>
                <VCardText>
                  <h6 class="text-h6">
                    {{ $t('Details') }}
                  </h6>
                  <VDivider />
                  <VList>
                    <VListItem>
                      <VListItemSubtitle>
                        <h6 class="text-sm">
                          {{ $t('Username:') }}
                          <span class="text-body-2">{{ customer.username }}</span>
                        </h6>
                      </VListItemSubtitle>
                    </VListItem>
                    <VListItem>
                      <VListItemSubtitle>
                        <h6 class="text-sm">
                          {{ $t('Email:') }}
                          <span class="text-body-2">{{ customer.email }}</span>
                        </h6>
                      </VListItemSubtitle>
                    </VListItem>
                    <VListItem>
                      <VListItemSubtitle>
                        <h6 class="text-sm">
                          {{ $t('Status:') }}
                          <span class="text-body-2">
                            <VChip
                              v-if="customer.status === 1"
                              color="primary"
                              variant="tonal"
                            >
                              {{ $t('Active') }}
                            </VChip>
                            <VChip
                              v-if="customer.status === 0"
                              color="secondary"
                              variant="tonal"
                            >
                              {{ $t('Inactive') }}
                            </VChip>
                            <VChip
                              v-if="customer.status === 2"
                              class="text-white"
                              color="red"
                              variant="tonal"
                            >
                              {{ $t('Inactive') }}
                            </VChip>
                          </span>
                        </h6>
                      </VListItemSubtitle>
                    </VListItem>
                    <VListItem>
                      <VListItemSubtitle>
                        <h6 class="text-sm">
                          {{ $t('Contact:') }}
                          <span class="text-body-2">{{ customer.phone }}</span>
                        </h6>
                      </VListItemSubtitle>
                    </VListItem>
                    <VListItem v-if="customer.currency">
                      <VListItemSubtitle>
                        <h6 class="text-sm">
                          {{ $t('Currency:') }}
                          <span class="text-body-2">{{ customer.currency.name }}</span>
                        </h6>
                      </VListItemSubtitle>
                    </VListItem>
                    <VListItem v-if="customer.language">
                      <VListItemSubtitle>
                        <h6 class="text-sm">
                          {{ $t('Language:') }}
                          <span class="text-body-2">{{ customer.language.name }}</span>
                        </h6>
                      </VListItemSubtitle>
                    </VListItem>
                    <VListItem v-if="customer.country">
                      <VListItemSubtitle>
                        <h6 class="text-sm">
                          {{ $t('Country:') }}
                          <span class="text-body-2">{{ customer.country }}</span>
                        </h6>
                      </VListItemSubtitle>
                    </VListItem>
                    <VListItem v-if="customer.website">
                      <VListItemSubtitle>
                        <h6 class="text-sm">
                          {{ $t('Website:') }}
                          <span class="text-body-2">{{ customer.website }}</span>
                        </h6>
                      </VListItemSubtitle>
                    </VListItem>
                    <VListItem>
                      <VListItemSubtitle>
                        <h6 class="text-sm">
                          {{ $t('Last Login IP:') }}
                          <span class="text-body-2">{{ customer.last_login_ip }}</span>
                        </h6>
                      </VListItemSubtitle>
                    </VListItem>
                  </VList>
                </VCardText>
                <VCardText class="d-flex justify-center">
                  <VBtn
                    class="me-3"
                    @click="$inertia.visit(route('admin.customers.edit', {customer: customer.id}))"
                  >
                    {{ $t('Edit') }}
                  </VBtn>
                  <VBtn
                    :color="customer.status!==2?'error':'success'"
                    @click="showSuspendDialog = true"
                  >
                    {{ customer.status === 2 ? $t('Activate') : $t('Suspend') }}
                  </VBtn>
                </VCardText>
              </VCard>
            </VCol>
            <VCol
              v-if="customer.plan"
              cols="12"
            >
              <VCard variant="elevated">
                <VCardText class="d-flex">
                  <VChip color="primary">
                    {{ customer.plan.name }}
                  </VChip>
                  <div class="flex-grow-1" />
                  <h3 class="text-h3 text-primary font-weight-semibold">
                    {{ currencyFormat(customer.inertval === 'monthly' ? customer.plan.monthly_price : customer.plan.yearly_price, $page.props.app.currency.code) }}
                  </h3>
                  <sub class="mt-3">
                    <h6 class="text-sm font-weight-regular">
                      / {{ customer.interval.replace('ly', '') }}
                    </h6>
                  </sub>
                </VCardText>
                <VCardText />
                <VCardText>
                  <div class="my-6">
                    <div class="d-flex font-weight-semibold mt-3 mb-2">
                      <h6 class="text-sm">
                        {{ $t('Expiration') }}
                      </h6>
                      <div class="flex-grow-1" />
                      <h6 class="text-sm">
                        {{ expiration }}
                      </h6>
                    </div>
                    <VProgressLinear
                      rounded
                      :model-value="percent"
                      color="primary"
                    />
                  </div>
                  <VBtn block>
                    {{ $t('Upgrade Plan') }}
                  </VBtn>
                </VCardText>
              </VCard>
            </VCol>
          </VRow>
        </VCol>
        <VCol
          cols="12"
          lg="8"
          md="7"
        >
          <VCard class="mb-5">
            <VTabs
              v-model="tab"
              background-color="deep-purple-darken-4"
              center-active
            >
              <VTab value="overview">
                <VIcon class="mr-2">
                  mdi-user
                </VIcon>
                {{ $t('Overview') }}
              </VTab>
              <VTab value="security">
                <VIcon class="mr-2">
                  mdi-lock
                </VIcon>
                {{ $t('Security') }}
              </VTab>
              <VTab value="notifications">
                <VIcon class="mr-2">
                  mdi-bell
                </VIcon>
                {{ $t('Notifications') }}
              </VTab>
              <VTab value="connections">
                <VIcon class="mr-2">
                  mdi-link
                </VIcon>
                {{ $t('Connections') }}
              </VTab>
            </VTabs>
          </VCard>

          <VWindow v-model="tab">
            <VWindowItem value="overview">
              <VCard>
                <VCardItem>
                  <VCardTitle>{{ $t('Schools') }}</VCardTitle>
                  <template #append>
                    <VBtn
                      append-icon="mdi-arrow-down"
                      color="primary"
                    >
                      {{ $t('Export') }}
                      <VMenu activator="parent">
                        <VList>
                          <VListItem
                            key="pdf"
                            value="pdf"
                          >
                            <VListItemTitle>PDF</VListItemTitle>
                          </VListItem>
                          <VListItem
                            key="xlsx"
                            value="xlsx"
                          >
                            <VListItemTitle>XLSX</VListItemTitle>
                          </VListItem>
                          <VListItem
                            key="csv"
                            value="csv"
                          >
                            <VListItemTitle>CSV</VListItemTitle>
                          </VListItem>
                        </VList>
                      </VMenu>
                    </VBtn>
                  </template>
                </VCardItem>
              </VCard>
            </VWindowItem>
            <VWindowItem value="security">
              <VCard>
                <VCardItem>
                  <VCardTitle>{{ $t('Change Password') }}</VCardTitle>
                </VCardItem>
                <VCardText>
                  <VAlert
                    class="mb-6"
                    color="warning"
                    icon="mdi-warning"
                  >
                    <VAlertTitle>{{ $t('Ensure that these requirements are met') }}</VAlertTitle>
                    <span>{{ $t('Minimum 8 characters long, uppercase & symbol') }}</span>
                  </VAlert>

                  <VForm @submit.prevent="submitPasswordForm">
                    <VRow>
                      <VCol
                        cols="12"
                        md="6"
                      >
                        <VTextField
                          v-model="passwordForm.password"
                          :append-inner-icon="showPassword ? 'mdi-eye' : 'mdi-eye-off'"
                          :error-messages="passwordForm.errors.password"
                          :label="$t('Password')"
                          :type="showPassword ? 'text' : 'password'"
                          hint="At least 8 characters"
                          @click:append-inner="showPassword = !showPassword"
                        />
                      </VCol>
                      <VCol
                        cols="12"
                        md="6"
                      >
                        <VTextField
                          v-model="passwordForm.password_confirmation"
                          :append-inner-icon="showConfirmPassword ? 'mdi-eye' : 'mdi-eye-off'"
                          :error-messages="passwordForm.errors.password_confirmation"
                          :label="$t('Confirm Password')"
                          :type="showConfirmPassword ? 'text' : 'password'"
                          @click:append-inner="showConfirmPassword = !showConfirmPassword"
                        />
                      </VCol>
                      <VCol cols="12">
                        <VBtn
                          :loading="passwordForm.processing"
                          type="submit"
                        >
                          {{ $t('Change Password') }}
                        </VBtn>
                      </VCol>
                    </VRow>
                  </VForm>
                </VCardText>
              </VCard>
            </VWindowItem>
            <VWindowItem value="notifications">
              <VCard>
                <VCardItem>
                  <VCardTitle>{{ $t('Notifications') }}</VCardTitle>
                  <VCardSubtitle>{{ $t('You will receive notification for the below selected items.') }}</VCardSubtitle>
                </VCardItem>
                <VCardText />
              </vcard>
            </vwindowitem>
            <VWindowItem value="connections">
              <VCard>
                <VCardItem>
                  <VCardTitle>{{ $t('Connections') }}</VCardTitle>
                </VCardItem>
                <VCardText />
              </vcard>
            </vwindowitem>
          </VWindow>
        </VCol>
      </VRow>
    </VContainer>
  </AppLayout>

  <VDialog
    v-model="showSuspendDialog"
    persistent
    max-width="30%"
  >
    <VCard>
      <VCardItem>
        <VCardTitle>
          {{ $t('Are you sure to :status the customer', {status: customer.status == 2 ? trans('activate') : trans('suspend')}) }}
        </VCardTitle>
      </VCardItem>
      <VCardText v-if="customer.status !== 2">
        {{ $t('Customer unable to access the account after the suspension') }}
      </VCardText>
      <VCardText v-if="customer.status == 2">
        {{ $t('After activation user can access the account') }}
      </VCardText>
      <VCardActions>
        <VSpacer />
        <VBtn
          color="primary"
          text
          @click="showSuspendDialog = false"
        >
          {{ $t('Cancel') }}
        </VBtn>
        <VBtn
          color="error"
          text
          @click="submitSuspension"
        >
          {{ customer.status == 2 ? $t('Activate') : $t('Suspend') }}
        </VBtn>
      </VCardActions>
    </VCard>
  </VDialog>
</template>
