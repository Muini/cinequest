class SessionsController < ApplicationController
  skip_before_action :require_login, only: [ :new, :create, :destroy ]  
    
  def new
  end

  def create
    user = User.find_by(pseudo: params[:session][:pseudo])
    if user && user.authenticate(params[:session][:password])
      log_in user
      redirect_to '../index'
    else
      flash[:danger] = 'Mauvais pseudo ou mot de passe !' # Not quite right!
      render 'new'
    end
  end

  def destroy
  end
end
