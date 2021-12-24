class RoomChannel < ApplicationCable::Channel
  def subscribed # クライアントがサーバーに接続したと同時に実行されるメソッド。
    stream_from 'room_channel' # データを送受信するための宣言。
  end

  def unsubscribed # クライアントがサーバーとの接続を解除したときに実行されるメソッド。
  end

  def speak(data)
    message = Message.create!(content: data['message'])
    ActionCable.server.broadcast 'room_channel', message: render_message(message)
  end

  private
  def render_message(message)
    ApplicationController.render(
      partial: 'messages/message',
      locals: { message: message }
    )
  end
end
