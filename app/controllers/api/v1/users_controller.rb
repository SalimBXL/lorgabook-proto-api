class Api::V1::UsersController < ApplicationController
  before_action :find_user, only: [:show, :update]


  def index
    @users = User.all
  end


  def show
    #@articles = Article.where(author: @user).count()
    @articles = @user.articles.count()
  end


  private

  def find_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(
      :fullname, 
      :email,
      :groupe
    )
  end
end
