class UsersController < ApplicationController

  def authenticate
    user = User.find_by(username: params[:username])
    if user && user.authenticate(params[:password])
      render json: user.id
    else
       render json: false
    end
  end


end
