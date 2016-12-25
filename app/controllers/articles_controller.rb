class ArticlesController < ApplicationController

  def index
    @articles = Article.all
  end

  def new
    @article = Article.new
  end

  def edit
    @article = Article.find(params[:id])
  end

  def create
    #render plain: params[:article].inspect

    @article = Article.new(article_params)
    # once its save redirect to the show template
    if @article.save
      # to handle flash we need to go to app/views/application.html.erb
      flash[:notice] = "Article was successfully created"
      redirect_to article_path(@article)
    else
      # add a disply for errors in the new template
      render "new"
    end
  end

  def update
    @article = Article.find(params[:id])
    if @article.update(article_params)
      flash[:notice] = "Article was successfully update"
      redirect_to article_path(@article)
    else
      render "edit"
    end
  end

  def show
    @article = Article.find(params[:id])
  end



  private
  # white list the params for create
  def article_params
    params.require(:article).permit(:title, :description)
  end
end
