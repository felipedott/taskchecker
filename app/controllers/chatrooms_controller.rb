class ChatroomsController < ApplicationController
  before_action :authenticate_user!

  def index
    @ids = []
    current_user.team_members.each do |id|
      @ids << id.team_id
    end

    # PERGUNTAR COMO TACAR ISSO DIRETO NO WHERE

    @chatroom = policy_scope(Chatroom).where(team_id: @ids)
    authorize @chatroom
  end

  def show
    @chatroom = Chatroom.find(params[:id])
    @message = Message.new
    authorize @chatroom
  end

end
