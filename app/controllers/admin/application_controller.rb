class Admin::ApplicationController < ApplicationController
  before_action :authenticate_admin!
  def index
  	@admin_articles = Article.all
  end

  private
    def authenticate_admin!
      :authenticate_user!
      unless current_user.admin?
      	flash[:alert] = "Admin only"
      	redirect_to root_path
      end
    end
end
