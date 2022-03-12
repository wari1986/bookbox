class ChatroomsController < ApplicationController
  def create
    @chatroom = Chatroom.new(name: "My chat")
    @chatroom.save
  end

  def show
    @chatroom = Chatroom.find(params[:id])
    @message = Message.new
  end
end
