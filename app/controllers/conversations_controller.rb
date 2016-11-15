class ConversationsController < ApplicationController

  before_action :get_mailbox
  before_action :get_conversation, except: [:index]

  def index
    @conversations = @mailbox.inbox.paginate(page: params[:page], per_page: 10)
  end

  def show
  end

  private

  def get_mailbox
    @mailbox ||= current_user.mailbox
  end

end
