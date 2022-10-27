import {defineStore} from "pinia"
import {ref} from "vue"

export const useSnackbarStore = defineStore('useSnackbarStore', {
  state: () => ({
    isShow: ref(false),
    message: ref(null),
    color: ref('primary'),
  }),

  actions: {
    showSnackbar(msg){
      this.isShow = true
      this.message = msg
    },
    hideSnackbar(){
      this.isShow = false
      this.message = null
    },
    showNotification(page){
      if (page.props?.flash?.success){
        this.color = 'primary'
        this.showSnackbar(page.props.flash.success)
      }
      if (page.props?.flash?.error){
        this.color = 'error'
        this.showSnackbar(page.props.flash.error)
      }
    },
  },
})
