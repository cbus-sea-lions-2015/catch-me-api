class UsersController < ApplicationController

  def index
    render json: User.all
  end

  def authenticate
    user = User.find_by(username: params[:username])
    if user && user.authenticate(params[:password])
      render json: user.id
    else
       render json: false
    end
  end

  def create
    user = User.new(user_params)
    if user.save
      render json: user.id
    else
      render json: false
    end
  end

   private

   def  user_params
     params.require(:register_data).permit(:username,:name,:handle,:password)
   end
end
