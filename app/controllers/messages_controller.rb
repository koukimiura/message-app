class MessagesController < ApplicationController
   before_action :authenticate_user!, :only => [:create]
    
    
    def create
        @message = Message.new(message_params)
        if @message.save
            redirect_to :back
        else
            render 'users/index'
    end
end
    
    
    
    
    private
    
    def message_params
        params.require(:message).permit(:user_id, :content, :room_id).merge(:user_id => current_user.id)
    
    end
end
