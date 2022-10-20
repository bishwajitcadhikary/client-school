import Toastify from "toastify-js";

export default {
  install: (app, options) => {
    const Notification = {
      success: (message) => {
        Toastify({
          text: message,
          close: true,
          gravity: "top",
          position: "right",
          stopOnFocus: true,
          style: {
            backgroundImage: "linear-gradient( 135deg, #CE9FFC 10%, #7367F0 100%)"
          }
        }).showToast();
      },
      error: (message) => {
        Toastify({
          text: message,
          close: true,
          gravity: "top",
          position: "right",
          stopOnFocus: true,
          style: {
            backgroundImage: "linear-gradient( 135deg, #FEB692 10%, #EA5455 100%)"
          }
        }).showToast();
      }
    }
    app.provide('Notification', Notification)
  }
}
