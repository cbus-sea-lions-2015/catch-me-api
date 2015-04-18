class UsersController < ApplicationController

  def authenticate
    user = User.find_by(username: params[:username])
    if user && user.authenticate(params[:password])
      render json: user.id
    else
       render json: false
    end
  end

  def create
    # user = User.new(user_params)
    logger.info params
    user = User.new(username: params[:username],name: params[:name],handle: params[:handle],password: params[:password])
    user.save
  end

   # private

   # def  user_params
   #   params.require(:register_data).permit(:username,:name,:handle,:password)
   # end
end
