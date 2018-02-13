class ArticlesController < ApplicationController

  def index
    @articles = Article.all.reverse
  end

  def show
    @article = Article.find(params[:id])
  end


  def new
    @article = Article.new
  end

  def create
    @new_article = params.require(:article).permit(:title, :content)
    @article = Article.new(@new_article)
    @article.save
    redirect_to articles_path
  end

  def edit
    @article = Article.find(params[:id])
  end

  def update
    article_to_change = Article.find(params[:id])
    @new_article = params.require(:article).permit(:title, :content)
    article_to_change.update(@new_article)
    redirect_to articles_path
  end

  def destroy
    @article = Article.find(params[:id])
    @article.destroy
    redirect_to articles_path
  end

end
