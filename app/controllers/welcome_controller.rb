class WelcomeController < ApplicationController
  def index
    render json: 'Hello to Catch Me Api'
  end
end