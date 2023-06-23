require "test_helper"

class ArticleCategoryTest < ActiveSupport::TestCase

  def setup
    @article_category = article_categories(:valid)
  end

  test 'valid article category' do
    assert @article_category.valid?
  end

  test 'invalid without name' do
    @article_category.name = nil
    refute @article_category.valid?, 'saved article category without a name'
    assert_not_nil @article_category.errors[:name], 'no validation error for name present'
  end

end
