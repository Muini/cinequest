class SessionsController < ApplicationController
  skip_before_action :require_login, only: [ :new, :create, :destroy ]  
    
  def new
    if logged_in?
      redirect_to :root 
    end
  end

  def create
    user = User.find_by(pseudo: params[:session][:pseudo])
    if user && user.authenticate(params[:session][:password])
      flash[:success] = 'Bienvenue à nouveau sur CineQuest !'
      log_in user
      redirect_to :root
    else
      flash[:danger] = 'Mauvais pseudo ou mot de passe !' # Not quite right!
      render 'new'
    end
  end

  def destroy
    log_out
    redirect_to :root
  end
end
