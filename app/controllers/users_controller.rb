class UsersController < SecuredController


  def create
    user = User.find_or_create_by(auth_id: params[:auth_id])
    render json: user.auth_id
  end

end
