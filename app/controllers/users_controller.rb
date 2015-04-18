class UsersController < ApplicationController

  def authenticate
    user = User.find_by(username: [:username])
    if user && user.authenticate([:password])
      render json: user.id
    else
       render json: false
    end
  end


end
