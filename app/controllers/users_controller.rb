class UsersController < ApplicationController
  def new
    @user = User.new
  end
  def create
    user = @user = User.new(user_params)
    if user.save
      render text:"Vous vous êtes bien inscrit !"
    else
      render :new
    end
  end
  def view
    @users_pseudo = User.all.map{|x| x.pseudo} 
  end
    
  private 
  def user_params
    params.require(:user).permit(:pseudo,:nom,:prenom,:email,:mdp,:url_img)
  end
end
