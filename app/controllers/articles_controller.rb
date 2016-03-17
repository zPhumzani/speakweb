class ArticlesController < ApplicationController
  before_action :authenticate_user!, only: [:upvote, :downvote]
  before_action :set_article, only: [:show, :upvote, :downvote]

  # GET /articles
  # GET /articles.json
  def index
    if params[:tag]
      @articles = Article.includes(:user, :comments).paginate(page: params[:page], per_page: 5).tagged_with(params[:tag])
      @page_header =  "its all about #{params[:tag].to_s}"
    else
      @articles = Article.includes(:user, :comments).paginate(page: params[:page], per_page: 5).where(publish: true)
    end
  end

  # GET /articles/1
  # GET /articles/1.json
  def show
  end

  def search
    @articles = Article.where(["lower(title) like ?", "%" + params[:search].downcase + "%"]).where(publish: true).paginate(page: params[:page], per_page: 10)
    if params['search'].to_s.size < 1
      redirect_to root_url, alert: "You just search for nothing?"
    else
      render :search
    end
  end

  def image 
    @image = Article.friendly.find(params[:id])
    send_data @image.file_contents, filename: @image.filename, type: @image.content_type, :diposition => "inline"
  end

  def upvote
    @article.upvote_by current_user
    redirect_to :back
  end

  def downvote
    @article.downvote_by current_user
    redirect_to :back
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_article
      @article = Article.friendly.find(params[:id])
    end
end
