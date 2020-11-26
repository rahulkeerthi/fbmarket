class MessagesController < ApplicationController
  def create
    @inbox = Inbox.find(params[:inbox_id])
    @message = Message.new(message_params)
    @message.inbox = @inbox
    @message.user = current_user
    authorize @message
    if @message.save
      redirect_to inbox_path(@inbox, anchor: "message-#{@message.id}")
    else
      render "inboxes/show"
    end
  end

  private

  def message_params
    params.require(:message).permit(:content)
  end
end
