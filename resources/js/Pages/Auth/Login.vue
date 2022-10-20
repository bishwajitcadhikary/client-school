<script setup>
import {computed, ref} from 'vue';
import { useTheme } from 'vuetify'
import logo from '@/assets/logo.svg?raw'
import AuthProvider from './AuthProvider.vue'
import authV1MaskDark from '@/assets/images/pages/auth-v1-mask-dark.png'
import authV1MaskLight from '@/assets/images/pages/auth-v1-mask-light.png'
import authV1Tree2 from '@/assets/images/pages/auth-v1-tree-2.png'
import authV1Tree from '@/assets/images/pages/auth-v1-tree.png'
import {useForm} from "@inertiajs/inertia-vue3";

defineProps({
    canResetPassword: Boolean,
    status: String
});

const form = useForm({
    email: '',
    password: '',
    remember: false,
})
const vuetifyTheme = useTheme()
const authThemeMask = computed(() => {
    return vuetifyTheme.global.name.value === 'light' ? authV1MaskLight : authV1MaskDark
})
const isPasswordVisible = ref(false)

const submit = () => {
    form.post(route('login'), {
        preserveScroll: true,
        onFinish: () => form.reset('password'),
    });
};
</script>

<template>
    <div class="auth-wrapper d-flex align-center justify-center pa-4">
        <VCard
            class="auth-card pa-4 pt-7"
            max-width="448"
        >
            <VCardItem class="justify-center">
                <template #prepend>
                    <div class="d-flex">
                        <div v-html="logo" />
                    </div>
                </template>

                <VCardTitle class="font-weight-semibold text-2xl text-uppercase">
                    {{ $page.props.app.name }}
                </VCardTitle>
            </VCardItem>

            <VCardText class="pt-2">
                <h5 class="text-h5 font-weight-semibold mb-1">
                    {{ $t('Welcome to :title!', {title: $page.props.app.name}) }}
                </h5>
                <p class="mb-0">
                    {{ $t('Please sign-in to your account and start the adventure') }}
                </p>
            </VCardText>

            <VCardText>
                <VForm @submit.prevent="submit">
                    <VRow>
                        <!-- email -->
                        <VCol cols="12">
                            <VTextField
                                v-model="form.email"
                                :label="$t('Email')"
                                type="email"
                                :error-messages="form.errors.email"
                                required
                            />
                        </VCol>

                        <!-- password -->
                        <VCol cols="12">
                            <VTextField
                                v-model="form.password"
                                :label="$t('Password')"
                                :type="isPasswordVisible ? 'text' : 'password'"
                                :append-inner-icon="isPasswordVisible ? 'mdi-eye-off-outline' : 'mdi-eye-outline'"
                                :error-messages="form.errors.password"
                                @click:append-inner="isPasswordVisible = !isPasswordVisible"
                                required
                            />

                            <!-- remember me checkbox -->
                            <div class="d-flex align-center justify-space-between flex-wrap mt-1 mb-4">
                                <VCheckbox
                                    v-model="form.remember"
                                    :label="$t('Remember me')"
                                />

                              <Link
                                v-if="canResetPassword"
                                :href="route('password.request')"
                                class="ms-2 mb-1"
                              >
                                {{ $t('Forgot Password?') }}
                              </Link>
                            </div>

                            <!-- login button -->
                            <VBtn
                                :loading="form.processing"
                                type="submit"
                                block
                            >
                                {{ $t('Login') }}
                            </VBtn>
                        </VCol>

                        <!-- create account -->
                        <VCol
                            cols="12"
                            class="text-center text-base"
                        >
                            <span>{{ $t('New on our platform?') }}</span>
                            <Link
                                class="text-primary ms-2"
                                :href="route('register')"
                            >
                                {{ $t('Create an account') }}
                            </Link>
                        </VCol>

                        <VCol
                            cols="12"
                            class="d-flex align-center"
                        >
                            <VDivider />
                            <span class="mx-4">{{ $t('or') }}</span>
                            <VDivider />
                        </VCol>

                        <!-- auth providers -->
                        <VCol
                            cols="12"
                            class="text-center"
                        >
                            <AuthProvider />
                        </VCol>
                    </VRow>
                </VForm>
            </VCardText>
        </VCard>

        <VImg
            class="auth-footer-start-tree d-none d-md-block"
            :src="authV1Tree"
            :width="250"
        />

        <VImg
            :src="authV1Tree2"
            class="auth-footer-end-tree d-none d-md-block"
            :width="350"
        />

        <!-- bg img -->
        <VImg
            class="auth-footer-mask d-none d-md-block"
            :src="authThemeMask"
        />
    </div>
</template>

<style lang="scss">
@use "@core/scss/pages/page-auth.scss";
</style>
