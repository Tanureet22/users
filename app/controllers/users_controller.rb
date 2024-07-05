class UsersController < ApplicationController
    def show_all
      if params[:search].present?
        @users = User.includes(:laguages).where("title LIKE ?", "%#{params[:search]}%").page(params[:page]).per(10)
        if @users.empty?
          flash.now[:notice] = "Sorry, no results found."
        end
      else
        @users = User.includes(:languages).page(params[:page]).per(10)
      end
    end
    def show
      @user = User.includes(:languages).find(params[:id])
    end
  end
  