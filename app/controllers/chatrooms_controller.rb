class ChatroomsController < ApplicationController
  before_action :authenticate_user!

  def show
    @chatroom = Chatroom.find(params[:id])
    @message = Message.new
    authorize @chatroom
  end

end
