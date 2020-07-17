class ArticlesController < ApplicationController
  before_action :set_article, only: [:show, :destroy, :edit, :update]

  def index
    @articles = Article.all
  end

  def show
    @article = Article.find(params[:id])

    @comment = Comment.new
    @comment.article_id = @article.id
  end

  def new
    @article = Article.new
  end

  def create
    @article = Article.new(article_params)
    @article.save

    flash.notice = "Article was created"

    redirect_to article_path(@article)
  end

  def destroy
    article = Article.destroy(params[:id])

    flash.notice = "#{article.title} was destroyed."

    redirect_to articles_path
  end

  def edit
    @article = Article.find(params[:id])
  end

  def update
    @article.update(article_params)

    flash.notice = "Article #{@article.title} Updated!"

    redirect_to article_path(@article)
  end

    private

    def article_params
      params.require(:article).permit(:title, :body, :tag_list)
    end

    def set_article
      @article = Article.find(params[:id])
    end
end
