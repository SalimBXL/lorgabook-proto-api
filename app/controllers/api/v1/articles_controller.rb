class Api::V1::ArticlesController < ApplicationController
  before_action :find_article, only: [:show]


  def index
    @articles = Article.all
    
  end

  def show
    @comments = @article.comments
  end

  private

  def find_article
    @article = Article.find(params[:id])
  end

  def article_params
    params.require(:article).permit(
      :title, 
      :body, 
      :user,
      :draft,
      :batch_number,
      :article_category,
      :resource
    )
  end
end
