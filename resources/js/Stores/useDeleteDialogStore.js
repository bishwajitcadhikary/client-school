import {defineStore} from "pinia"
import {useForm} from "@inertiajs/inertia-vue3"
import {useSnackbarStore} from "@/Stores/useSnackbarStore"

export const useDeleteDialogStore = defineStore('useDeleteDialogStore', {
  state: () => ({
    // Dialog
    isShow: ref(false),
    href: ref(null),
    callback: ref(null),
    loading: ref(false),
  }),

  actions: {
    onDelete(){
      this.loading = true
      useForm({})
        .delete(this.href, {
          preserveScroll: true,
          preserveState: true,
          onSuccess: page => {
            useSnackbarStore().showNotification(page)
            if (this.callback){
              this.callback()
            }
          },
          onFinish: params => {
            this.isShow = false
            this.loading = false
          },
        })
    },
    showDialog(href){
      this.isShow = true
      this.href = href
    },
  },
})
