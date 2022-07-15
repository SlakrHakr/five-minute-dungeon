import consumer from "./consumer"

document.addEventListener("turbolinks:load", function() {
  if ($("body").data('game') !== undefined) {
    consumer.subscriptions.create({ channel: "GameChannel", game: $("body").data('game') }, {
      connected() {
        // Called when the subscription is ready for use on the server
      },

      disconnected() {
        // Called when the subscription has been terminated by the server
      },

      received(data) {
        console.log(data);
      }
    });
  }
})
