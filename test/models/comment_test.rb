require "test_helper"

class CommentTest < ActiveSupport::TestCase

  def setup
    @user = User.new(
      fullname: 'John', 
      email: 'john@example.com', 
      groupe: @groupe
    )
    @article_category = ArticleCategory.new(
      name: 'Article Cat1', 
      description: "Just a simple article category.", 
    )
    @resource_category = ResourceCategory.new(
      name: 'Ressource Cat1', 
      description: "Just a simple article.", 
    )
    @resource_location = ResourceLocation.new(
      name: 'Labo 1', 
      description: "Laborarory #1", 
    )
    @reference_person = User.new(
      fullname: 'John', 
      email: 'john@example.com', 
      groupe: @groupe
    )
    @resource = Resource.new(
      name: 'Ressource Cat1', 
      resource_category: @resource_category,
      resource_location: @resource_location,
      reference_person: @reference_person
    )
    @article = Article.new(
      title: 'This is a title', 
      body: "This is an article main body text.",
      batch_number: "FDG001",
      user: @user,
      article_category: @article_category,
      resource: @resource
    )
    @comment = Comment.new(
      body: 'Ressource Cat1', 
      user: @user, 
      article: @article
    )
  end

  test 'valid comment' do
    assert @comment.valid?
  end

  test 'invalid without body' do
    @comment.body = nil
    refute @comment.valid?, 'saved comment without a body'
    assert_not_nil @comment.errors[:body], 'no validation error for body present'
  end

  test 'invalid without user' do
    @comment.user = nil
    refute @comment.valid?, 'saved comment without a user'
    assert_not_nil @comment.errors[:user], 'no validation error for user present'
  end

  test 'invalid without article' do
    @comment.article = nil
    refute @comment.valid?, 'saved comment without an article'
    assert_not_nil @comment.errors[:article], 'no validation error for article present'
  end

end
