class ChatroomsController < ApplicationController
  def show
    @chatroom = Chatroom.find(params[:id])
    @message = ChatroomMessage.new
    authorize @chatroom
  end
end
