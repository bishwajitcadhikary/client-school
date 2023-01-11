<script setup>
import {ref} from "vue"
import {Inertia} from "@inertiajs/inertia"
import {useSnackbarStore} from "@/Stores/useSnackbarStore"

defineProps({
  plans: {
    type: Object,
    default: null,
  },
})

const interval = ref(false)

const goToPayment = plan => {
  Inertia.visit(route('customer.subscription.payment', plan), {
    onSuccess: page => {
      useSnackbarStore().showNotification(page)
    },
  })
}
</script>

<template>
  <AppLayout :title="$t('Subscription')">
    <VContainer>
      <VRow class="mb-3">
        <VCol
          v-if="!$page.props.auth.user?.plan_id"
          cols="12"
          md="7"
        >
          <VAlert
            icon="mdi-information"
            color="error"
          >
            {{ $t('You are not subscribed to any plan.') }}
          </VAlert>
        </VCol>
        <VCol
          v-if="$page.props.auth.user?.plan_id && $page.props.auth.plan_expired"
          cols="12"
          md="7"
        >
          <VAlert
            icon="mdi-information"
            color="error"
          >
            {{ $t('Your subscription has expire, please renew your subscription.') }}
          </VAlert>
        </VCol>
      </VRow>

      <VCard>
        <VCardText class="pt-12 mb-16 pb-16">
          <VRow>
            <VCol
              cols="12"
              sm="8"
              lg="10"
              md="12"
              class="mx-auto"
            >
              <VCardText class="text-center">
                <h4 class="text-h4 pricing-title mb-4">
                  {{ $t('Pricing Plans') }}
                </h4>
                <p>{{ $t('Choose the best plan to fit your needs.') }}</p>
              </VCardText>

              <VRow justify="center">
                <VCol
                  v-for="(plan, index) in plans"
                  :key="index"
                  cols="12"
                  md="4"
                >
                  <VCard>
                    <VCardText class="v-card-text text-center">
                      <h5 class="text-h5 mb-2">
                        {{ plan.name }}
                      </h5>
                    </VCardText>
                    <VCardText class="position-relative text-center">
                      <div class="d-flex justify-center align-center">
                        <sup class="text-sm font-weight-medium me-1">{{ $page.props.app?.currency?.symbol }}</sup>
                        <h1 class="text-5xl font-weight-medium text-primary">
                          {{ plan.price }}
                        </h1>
                        <sub class="text-sm font-weight-medium ms-1 mt-4">/{{ $t('year') }}</sub>
                      </div>
                    </VCardText>
                    <VCardText class="pt-2">
                      <p class="text-justify">
                        {{ plan.description }}
                      </p>

                      <VCardList>
                        <VListItem
                          prepend-icon="mdi-circle-outline"
                          type="text"
                        >
                          {{ $t(':school_count School Limit', {school_count: plan.school_limit}) }}
                        </VListItem>
                      </VCardList>
                    </VCardText>

                    <VCardActions>
                      <VTooltip :text="$t('Click to renew')">
                        <template #activator="{ props }">
                          <VBtn
                            v-if="$page.props.auth.user.plan_id == plan.id && !$page.props.auth.plan_expired"
                            color="success"
                            variant="success"
                            depressed
                            block
                            v-bind="props"
                            @click="goToPayment(plan.id)"
                          >
                            {{ $t('Your Current Plan') }}
                          </VBtn>
                        </template>
                      </VTooltip>
                      <VBtn
                        v-if="$page.props.auth.user.plan_id == plan.id && $page.props.auth.plan_expired"
                        color="success"
                        variant="success"
                        depressed
                        block
                        @click="goToPayment(plan.id)"
                      >
                        {{ $t('Renew') }}
                      </VBtn>
                      <VBtn
                        v-else
                        color="primary"
                        block
                        @click="goToPayment(plan.id)"
                      >
                        {{ $t('Purchase') }}
                      </VBtn>
                    </VCardActions>
                  </VCard>
                </VCol>
              </VRow>
            </VCol>
          </VRow>
        </VCardText>
      </VCard>
    </VContainer>
  </AppLayout>
</template>
