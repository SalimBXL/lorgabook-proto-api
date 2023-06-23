class Api::V1::CommentsController < ApplicationController
    before_action :find_comment, only: [:show, :update]


  def index
    @comments = Comment.all
  end


  def show
  end


  private

  def find_comment
    @comment = Comment.find(params[:id])
  end

  def comment_params
    params.require(:comment).permit(
      :body, 
      :user
    )
  end
end
