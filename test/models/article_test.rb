require "test_helper"

class ArticleTest < ActiveSupport::TestCase

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
  end

  test 'valid article' do
    assert @article.valid?
  end

  test 'invalid without title' do
    @article.title = nil
    refute @article.valid?, 'saved article without a title'
    assert_not_nil @article.errors[:title], 'no validation error for title present'
  end

  test 'invalid without body' do
    @article.body = nil
    refute @article.valid?, 'saved article without a body'
    assert_not_nil @article.errors[:body], 'no validation error for body present'
  end

  test 'invalid without batch number' do
    @article.batch_number = nil
    refute @article.valid?, 'saved article without a batch number'
    assert_not_nil @article.errors[:batch_number], 'no validation error for batch number present'
  end

  test 'invalid without user' do
    @article.user = nil
    refute @article.valid?, 'saved article without a user'
    assert_not_nil @article.errors[:user], 'no validation error for user present'
  end

  test 'invalid without category' do
    @article.article_category = nil
    refute @article.valid?, 'saved article without a category'
    assert_not_nil @article.errors[:article_category], 'no validation error for category present'
  end

  test 'invalid without resource' do
    @article.resource = nil
    refute @article.valid?, 'saved article without a resource'
    assert_not_nil @article.errors[:resource], 'no validation error for resource present'
  end

end
