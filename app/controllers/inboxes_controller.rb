class InboxesController < ApplicationController
  def show
    @inbox = Inbox.find(params[:id])
    @message = Message.new
    authorize @inbox
  end
end
