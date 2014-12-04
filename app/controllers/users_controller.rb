class UsersController < ApplicationController
  skip_before_action :require_login, only: [ :new, :create, :users_list ]

# Account creation
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

# Users listing
  def users_list
    # @users_pseudo = User.all.map{|x| x.pseudo} 
    @users = User.all
  end
  def index
    redirect_to "/users_list"
  end
    
# Profil
  def show
    @user = User.find(params[:id])
    if @user.nil?
      flash[:alert] = "Cet utilisateur n'existe pas !"
      redirect_to "/index"
    end
  end

# Private
  private
    
  def user_params
    params.require(:user).permit(:pseudo,:nom,:prenom,:email,:password,:url_img,:password_digest)
  end
end
