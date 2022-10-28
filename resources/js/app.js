import './bootstrap'

import {createApp, h} from 'vue'
import {createInertiaApp, Link, Head} from '@inertiajs/inertia-vue3'
import {InertiaProgress} from '@inertiajs/progress'
import {resolvePageComponent} from 'laravel-vite-plugin/inertia-helpers'
import {ZiggyVue} from '../../vendor/tightenco/ziggy/dist/vue.m'

import Vuetify from "@/plugins/vuetify"
import {createPinia} from 'pinia'
import { i18nVue } from 'laravel-vue-i18n'

import AppLayout from '@/Layouts/AppLayout.vue'
import functions from "@/plugins/functions"

const pinia = createPinia()
const appName = window.document.getElementsByTagName('title')[0]?.innerText || 'Laravel'

createInertiaApp({
  title: title => `${title} - ${appName}`,
  resolve: name => resolvePageComponent(`./Pages/${name}.vue`, import.meta.glob('./Pages/**/*.vue')),
  setup({el, app, props, plugin}) {
    return createApp({render: () => h(app, props)})
      .use(plugin)
      .use(ZiggyVue)
      .use(i18nVue, {
        resolve: async lang => {
          const languages = import.meta.glob('../../lang/*.json')

          return await languages[`../../lang/${lang}.json`]()
        },
      })
      .use(Vuetify)
      .use(pinia)
      .use(functions)
      .component('AppLayout', AppLayout)
      .component('Link', Link)
      .component('Head', Head)
      .mount(el)
  },
})

InertiaProgress.init({color: '#4B5563'})
