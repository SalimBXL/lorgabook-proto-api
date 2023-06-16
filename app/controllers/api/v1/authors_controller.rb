class Api::V1::AuthorsController < ApplicationController
  before_action :find_author, only: [:show, :update]


  def index
    @authors = Author.all
  end


  def show
    @articles = Array.new
    @author.articles.each do |article|
      @articles.append({
        id: article.id,
        title: article.title,
        created_at: article.created_at
      })
    end
  end


  private

  def find_author
    @author = Author.find(params[:id])
  end

  def author_params
    params.require(:author).permit(:fullname, :email)
  end
end
