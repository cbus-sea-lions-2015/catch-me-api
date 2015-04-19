class AuthController < ApplicationController

  def register
    user = User.new(user_params)
    if user.save
      token = AuthToken.issue_token({ user_id: user.id })
      render json: { user: user,
                     token: token }
    else
      render json: { errors: user.errors }
    end
  end

  private
  def user_params
    params.require(:register_data).permit(:username,:name,:handle,:password)
  end

end
