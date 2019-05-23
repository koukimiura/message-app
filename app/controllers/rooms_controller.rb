class RoomsController < ApplicationController
  def new
    
  end

  def index
    @rooms = Room.all.order(created_at: :desc)
  end

  def show
    @room = Room.find(params[:id])
    @messages = @room.messages
    @message = Message.new
    @entries = @room.entries
  end

  def create
    @room = Room.create
    @entry1 = Entry.new(room_id: @room.id, user_id: current_user.id)
    @entry2 = Entry.new(room_params2)
     if@entry1.save || @entry2.save
     redirect_to "/rooms/#{@room.id}"
    flash[:notice] = "チャットを作成しました！"
    else
      flash[:alert] = "チャットを失敗しました！"
      render "users/show"
    end
    
    
  end

  def edit
    @room = Room.find(params[:id])
    
  end

  def update
     @room = Room.find(params[:id])
     if @room.update(room_params)
    flash[:notice] = "チャット情報が変更されました"
    redirect_to :back
  else
    render 'rooms/edit'
  end
end


 
    
    private
    def room_params
      params.require(:room).permit(:name, :explain)
    end
    
    def room_params2
      params.require(:entry).permit(:room_id, :user_id).merge(:room_id => @room.id)
    end
  
end
