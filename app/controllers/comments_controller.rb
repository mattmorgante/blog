class CommentsController < ApplicationController
  http_basic_authenticate_with name: 'Matt', password: '12345678', only: :destroy

  def create 
    @article = Article.find(params[:article_id])

    # use the create method on article.comments 
    @comment = @article.comments.create(comment_params)
    redirect_to article_path(@article)
  end

  def destroy
    #wtf is going on here? 
    @article = Article.find(params[:article_id])
    @comment = @article.comments.find(params[:id])
    @comment.destroy 
    redirect_to article_path (@article)
  end

  private 
    def comment_params 
      params.require(:comment).permit(:commenter, :body)
    end
end
