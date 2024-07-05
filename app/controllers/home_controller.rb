class HomeController < ApplicationController
  def index
    if params[:search].present?
      @users_with_languages = User.includes(:languages).where("users.id LIKE ?", "%#{params[:search]}%")
      @languages = Language.includes(:user).where("languages.name LIKE ?", "%#{params[:search]}%")
    else
      @users_with_languages = User.includes(:languages).all
      @languages = Language.all
    end
  
    @users_with_languages = @users_with_languages.page(params[:page]).per(10)
  end
  
end
