import {trans} from "laravel-vue-i18n"

export default {
  required: value => !!value || 'Required.',
  counter: value => value.length <= 20 || 'Max 20 characters',
  email: value => {
    const pattern = /^(([^<>()[\]\\.,;:\s@"]+(\.[^<>()[\]\\.,;:\s@"]+)*)|(".+"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/

    return pattern.test(value) || 'Invalid e-mail.'
  },
  image_size_1MB: value => {
    return !value || !value.length || value[0].size < 1000000 || trans('Image size should be less than 1 MB!')
  },
}

