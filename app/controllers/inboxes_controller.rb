class InboxesController < ApplicationController
  def index
    @inboxes = policy_scope(Inbox)
    # @inboxes = policy_scope(Inbox).where_has_user(current_user)
  end

  def show
    @inbox = Inbox.find(params[:id])
    @message = Message.new
    authorize @inbox
  end
end
