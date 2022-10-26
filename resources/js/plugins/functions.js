import moment from "moment"
import {usePage} from "@inertiajs/inertia-vue3"

const page = usePage()

export default {
  install: (app, options) => {
    const dateFormat = function (date, format = 'DD MMM, YYYY') {
      return moment(date, format)
    }
    const currencyFormat = function(amount, code = page.props.app.currency.code) {
      return new Intl.NumberFormat('en-US', {
        style: 'currency',
        currency: code,
      }).format(amount)
    }

    app.provide('currencyFormat', currencyFormat)
  },
}
