class WelcomeController < SecuredController
  skip_before_action :validate_token
  def index
    render json: 'Hello to Catch Me Api'
  end
end