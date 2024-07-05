class LanguagesController < ApplicationController
    def show_all
      if params[:search].present?
        @languages = Language.where("name LIKE ?", "%#{params[:search]}%").page(params[:page]).per(20)
        if @languages.empty?
          flash.now[:notice] = "Sorry, no results found."
        end
      else
        @languages = Language.page(params[:page]).per(20)
      end
    end
    def show
      @language = Language.find(params[:id])
    end
  end
  