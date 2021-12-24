App.room = App.cable.subscriptions.create('RoomChannel', {
  connected: function () {
    // Called when the subscription is ready for use on the server
    // alert('connected')
    window.addEventListener('keypress', function (e) {
      if (e.keyCode === 13) {
        App.room.speak(e.target.value);
        e.target.value = '';
        e.preventDefault();
      }
    })
  },

  disconnected: function () {
    // Called when the subscription has been terminated by the server
    // alert('disconnected')
  },

  received: function (data) {
    // Called when there's incoming data on the websocket for this channel
    // alert('received')
    const element = document.querySelector('#messages')
    element.insertAdjacentHTML('beforeend', data['message'])
  },

  speak: function (message) {
    // alert('speak')
    return this.perform('speak', { message: message });
  }
});
