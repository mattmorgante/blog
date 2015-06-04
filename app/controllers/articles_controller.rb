class ArticlesController < ApplicationController
  def create 
    @article = Article.new(article_params)
  
    # return a boolean indicating whethe or not the article was saved 
    if @article.save
      redirect_to @article
    else 
      render 'new'
    end 
  end 

  def show 
    @article = Article.find(params[:id])
  end   

  def new 
    @article = Article.new 
  end 

  def index
    @articles = Article.all
  end

  private 
    def article_params 
      params.require(:article).permit(:title, :text)
    end 

end
