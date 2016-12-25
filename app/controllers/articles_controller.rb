class ArticlesController < ApplicationController

  before_action :set_article, only: [:edit, :update, :show, :destroy]

  def index
    @articles = Article.all
  end

  def new
    @article = Article.new
  end

  def edit
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

    if @article.update(article_params)
      flash[:notice] = "Article was successfully update"
      redirect_to article_path(@article)
    else
      render "edit"
    end
  end

  def show
  end

  def destroy
    @article.destroy
    flash[:notice] = "Article was successfully deleted"
    redirect_to articles_path
  end

  private
  def set_article
    @article = Article.find(params[:id])
  end
  # white list the params for create
  def article_params
    params.require(:article).permit(:title, :description)
  end
end
