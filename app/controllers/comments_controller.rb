class CommentsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_article

  def create
    if current_user
  	@comment = @article.comments.build(comment_params)
  	@comment.user = current_user

  	if @comment.save
  	  flash[:success] = "Comment Created"
  	  redirect_to @article
  	else
  	  flash.now[:alert] = "Something went wrong!!!"
  	  redirect_to @article
  	end
    end
  end

  private
    def comment_params
      params.require(:comment).permit(:body)
    end

    def set_article
      @article = Article.friendly.find(params[:article_id])
    end
end
