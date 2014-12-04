class UsersController < ApplicationController
  skip_before_action :require_login, only: [ :new, :create, :view ]
    
  def new
    @user = User.new
  end
    
  def create
    @user = User.new(user_params)
    if @user.save
      flash[:success] = "Vous vous êtes bien inscrit !"
      redirect_to @user
    else
      render :new
    end
  end
    
  def view
    @users_pseudo = User.all.map{|x| x.pseudo} 
  end
    
  def show
    # Profil
    @user = User.find(params[:id])
    if @user.nil?
      flash[:alert] = "Cet utilisateur n'existe pas !"
      redirect_to "/index"
    end
  end
    
  private
    
  def user_params
  params.require(:user).permit(:pseudo,:nom,:prenom,:email,:mdp,:url_img)
  end
end
