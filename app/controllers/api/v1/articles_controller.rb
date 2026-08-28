class Api::V1::ArticlesController < ApplicationController
  def index
    article = Article.all
    render json: article
  end

  def create
    article = Article.new(article_params)
    if article.save
      render json: article, status: :created
    else
      render json: {errors: article.errors}, status: :unprocessable_entity
    end
  end

  private

  def article_params
  params.require(:article).permit(:title, :content)
  end
end
