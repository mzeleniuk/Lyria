jQuery(document).on 'turbolinks:load', ->
  messages = $('#messages')

  if $('#messages').length > 0
    messages_to_bottom = -> messages.scrollTop(messages.prop("scrollHeight"))

    messages_to_bottom()

    App.global_chat = App.cable.subscriptions.create {
        channel: 'RoomsChannel'
        room_id: messages.data('room-id')
      },

      connected: ->
        # Called when the subscription is ready for use on the server

      disconnected: ->
        # Called when the subscription has been terminated by the server

      received: (data) ->
        messages.append data['message']
        messages_to_bottom()

      send_message: (message, room_id) ->
        @perform 'send_message', message: message, room_id: room_id

    $('#new_message').submit (e) ->
      $this = $(this)
      textarea = $this.find('#message_body')

      if $.trim(textarea.val()).length > 1
        App.global_chat.send_message textarea.val(), messages.data('room-id')
        textarea.val('')

      e.preventDefault()

      return false

    $('#message_body').on 'keydown', (event) ->
      textarea = $(this)

      if event.keyCode is 13 && event.shiftKey && $.trim(textarea.val()).length > 1
        App.global_chat.send_message textarea.val(), messages.data('room-id')
        textarea.val('')

        event.preventDefault()
