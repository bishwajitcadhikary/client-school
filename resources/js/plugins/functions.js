import moment from "moment"

export default {
  install: (app, options) => {
    const dateFormat = function (date, format = 'DD MMM, YYYY') {
      return moment(date, format)
    }
  },
}
