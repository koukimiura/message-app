class UsersController < ApplicationController
    
     before_action :authenticate_user!,  :only => [:index, :show, :edit, :update]
    before_action :ensure_correct_user, :only => [:edit, :update]
   
   def index
      @users =User.all
   end
   
   def show
      @user = User.find(params[:id])
      if @user.id == current_user.id
    else
         @room = Room.new
    end
   end
   
   def edit 
       @user = User.find(params[:id])
   end
   
   def update
       @user = User.find(params[:id])
      if  @user.update(user_params)
       #@user.save
          flash[:notice] ="ユーザーを編集しました。"
          redirect_to user_path
       else
          flash[:alert] = "ユーザーの編集に失敗しました。"
          render "users/edit"
   end
end


      def ensure_correct_user
    #@user = User.find(params[:id])
    if current_user.id!= params[:id].to_i
      flash[:alert] = "権限はありません"
      redirect_to users_path
    end
  end
   
   private
   def user_params
   params.require(:user).permit(:family_name, :first_name, :self_introduction)
 end
end
