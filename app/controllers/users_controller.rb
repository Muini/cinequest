class UsersController < ApplicationController
  skip_before_action :require_login, only: [ :new, :create, :user_profil ]

# Account creation
  def new
    if(logged_in?)
      flash[:success] = "Vous êtes déjà inscrit et connecté sur le site !"
      redirect_to :root  
    else
      @user = User.new
    end
  end
    
  def create
    @user = User.new(user_params)
    if @user.save
      log_in @user
      flash[:success] = "Vous vous êtes bien inscrit !"
      redirect_to :root
    else
      render :new
    end
  end

# Users listing
  def users_list
    # @users_pseudo = User.all.map{|x| x.pseudo} 
    @users = User.all
  end
    
# Profil par pseudo :D
  def user_profil
    @user = User.find_by(pseudo: params[:pseudo])
    if @user.nil?
      flash[:error] = "Cet utilisateur n'existe pas !"
      redirect_to :root
    else
      @nbr_comment = @user.comments.count
    end
  end

# Private
  private
    
  def user_params
    params.require(:user).permit(:pseudo,:nom,:prenom,:email,:password,:url_img,:password_digest)
  end
end
