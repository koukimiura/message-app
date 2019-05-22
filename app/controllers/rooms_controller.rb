class RoomsController < ApplicationController
  def new
    
  end

  def index
    
  end

  def show
    @room = Room.find(params[:id])
    @messages = @room.messages
    @message = Message.new
  end

  def create
    @roon = Room.create
    redirect_to @room
    flash[:notice] = "チャットを作成しました！"
    
  end

  def edit
    
  end

  def update
    
  end
end
