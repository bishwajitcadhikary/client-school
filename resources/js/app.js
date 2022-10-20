const appName = window.document.getElementsByTagName('title')[0]?.innerText || 'Laravel';
import './bootstrap';
import 'toastify-js/src/toastify.css'

import {createApp, h} from 'vue';
import {createInertiaApp, Link, Head} from '@inertiajs/inertia-vue3';
import {InertiaProgress} from '@inertiajs/progress';
import {resolvePageComponent} from 'laravel-vite-plugin/inertia-helpers';
import {ZiggyVue} from '../../vendor/tightenco/ziggy/dist/vue.m';

import Vuetify from "@/plugins/vuetify";
import {createPinia} from 'pinia';
import { i18nVue } from 'laravel-vue-i18n';
// import { VueReCaptcha } from "vue-recaptcha-v3";

import AdminLayout from '@/Layouts/AdminLayout.vue';
import notifications from '@/plugins/notifications'


createInertiaApp({
  title: (title) => `${title} - ${appName}`,
  resolve: (name) => resolvePageComponent(`./Pages/${name}.vue`, import.meta.glob('./Pages/**/*.vue')),
  setup({el, app, props, plugin}) {
    return createApp({render: () => h(app, props)})
      .use(plugin)
      .use(ZiggyVue)
      .use(i18nVue, {
        resolve: async lang => {
          const languages = import.meta.glob('../../lang/*.json');
          return await languages[`../../lang/${lang}.json`]();
        }
      })
      // .use(VueReCaptcha, { siteKey: "6LeyzJIiAAAAAFaFggMe-hxhijjAZ5zCAE8-j2OX" })
      .use(Vuetify, createPinia)
      .use(notifications)
      .component('AdminLayout', AdminLayout)
      .component('Link', Link)
      .component('Head', Head)
      .mount(el);
  },
});

InertiaProgress.init({color: '#4B5563'});
