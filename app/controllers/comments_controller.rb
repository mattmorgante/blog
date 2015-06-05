class CommentsController < ApplicationController
  def create 
    @article = Article.find(params[:article_id])

    # use the create method on article.comments 
    @comment = @article.comments.create(comment_params)
    redirect_to article_path(@article)
  end

  private 
    def comment_params 
      params.require(:comment).permit(:commenter, :body)
    end
end
