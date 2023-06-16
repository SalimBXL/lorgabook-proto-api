class Api::V1::ArticlesController < ApplicationController
  before_action :find_article, only: [:show]


  def index
    @articles = Article.all
  end

  def show
    @comments = Array.new
    @article.comments.each do |comment|
      author = {id: comment.author.id, fullname: comment.author.fullname}
      comment = {id: comment.id, body: comment.body, author: author}
      @comments.append(comment)
    end
  end

  private

  def find_article
    @article = Article.find(params[:id])
  end

  def article_params
    params.require(:article).permit(:title, :body, :author)
  end
end
