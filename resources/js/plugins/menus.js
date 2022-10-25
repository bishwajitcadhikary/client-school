import {trans} from "laravel-vue-i18n"

export default {
  adminMenu: [
    {
      title: trans('Dashboard'),
      href: route('admin.dashboard.index'),
      icon: 'mdi-home-outline',
      active: route().current('admin.dashboard.*'),
    },
    {
      title: trans('Customers'),
      href: route('admin.customers.index'),
      icon: 'mdi-users',
      active: route().current('admin.customers.*'),
    },
    {
      title: trans('Settings'),
      href: route('admin.settings.account-settings.index'),
      icon: 'mdi-cog-outline',
      active: route().current('admin.settings.*'),
    },
  ],
}
