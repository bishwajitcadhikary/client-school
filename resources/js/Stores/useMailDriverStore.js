import {useForm} from "@inertiajs/inertia-vue3"

export const useMailDriverStore = defineStore('useMailDriverStore', {
  state: () => ({
    form: useForm({
      mail_driver: 'smtp',

      basic: {
        mail_from_address: null,
        mail_from_name: null,
      },

      smtp: {
        mail_host: null,
        mail_username: null,
        mail_password: null,
        mail_port: null,
        mail_encryption: 'tls',
        mail_from_address: null,
        mail_from_name: null,
      },

      mailgun: {
        mail_mailgun_domain: null,
        mail_mailgun_secret: null,
        mail_mailgun_endpoint: null,
        mail_from_address: null,
        mail_from_name: null,
      },

      ses: {
        mail_host: null,
        mail_port: null,
        mail_encryption: 'tls',
        mail_from_address: null,
        mail_from_name: null,
        mail_ses_key: null,
        mail_ses_secret: null,
      },
    }),
    mail_drivers: [
      {
        title: 'smtp',
        value: 'smtp',
      },
      {
        title: 'mail',
        value: 'mail',
      },
      {
        title: 'sendmail',
        value: 'sendmail',
      },
      {
        title: 'mailgun',
        value: 'mailgun',
      },
      {
        title: 'ses',
        value: 'ses',
      },
    ],
    mail_encryption: [
      {
        title: 'tls',
        value: 'tls',
      },
      {
        title: 'ssl',
        value: 'ssl',
      },
      {
        title: 'starttls',
        value: 'starttls',
      },
    ],
  }),

  actions: {
    getMailConfig(config) {
      this.form.mail_driver = config.mail_driver
      // eslint-disable-next-line sonarjs/no-small-switch
      switch (config.mail_driver) {
      case 'smtp':
        this.form.smtp = {
          mail_host: config.mail_host,
          mail_username: config.mail_username,
          mail_password: config.mail_password,
          mail_port: config.mail_port,
          mail_encryption: config.mail_encryption,
          mail_from_address: config.mail_from_address,
          mail_from_name: config.mail_from_name,
        }
        break
      case 'mailgun':
        this.form.mailgun = {
          mail_host: config.mail_host,
          mail_username: config.mail_username,
          mail_password: config.mail_password,
          mail_port: config.mail_port,
          mail_encryption: config.mail_encryption,
          mail_from_address: config.mail_from_address,
          mail_from_name: config.mail_from_name,
        }
        break
      case 'ses':
        this.form.ses = {
          mail_host: config.mail_host,
          mail_username: config.mail_username,
          mail_password: config.mail_password,
          mail_port: config.mail_port,
          mail_encryption: config.mail_encryption,
          mail_from_address: config.mail_from_address,
          mail_from_name: config.mail_from_name,
        }
        break
      case 'sendmail':
      case 'mail':
        this.form.basic = {
          mail_host: config.mail_host,
          mail_username: config.mail_username,
          mail_password: config.mail_password,
          mail_port: config.mail_port,
          mail_encryption: config.mail_encryption,
          mail_from_address: config.mail_from_address,
          mail_from_name: config.mail_from_name,
        }
        break
      }
    },
  },
})
