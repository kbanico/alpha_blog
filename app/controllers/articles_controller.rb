class ArticlesController < ApplicationController
  def new
    @article = Article.new
  end

  def create
    #render plain: params[:article].inspect
    @article = Article.new(article_params)
    @article.save
    # once its save redirect to the show template
    redirect_to articles_show(@articles)
  end


  private
  # white list the params for create
  def article_params
    params.require(:article).permit(:title, :description)
  end
end
