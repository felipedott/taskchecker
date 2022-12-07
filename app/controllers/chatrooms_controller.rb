class ChatroomsController < ApplicationController
  before_action :authenticate_user!

  def index
    @chatroom = policy_scope(Chatroom)
    authorize @chatroom
  end

  def show
    @chatroom = Chatroom.find(params[:id])
    @message = Message.new
    authorize @chatroom
  end

end
