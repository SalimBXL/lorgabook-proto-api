require "test_helper"

class ResourceCategoryTest < ActiveSupport::TestCase

  def setup
    @resource_category = ResourceCategory.new(
      name: 'Ressource Cat1', 
      description: "Just a simple resource category.", 
    )
  end

  test 'valid resource category' do
    assert @resource_category.valid?
  end

  test 'invalid without name' do
    @resource_category.name = nil
    refute @resource_category.valid?, 'saved resource category without a name'
    assert_not_nil @resource_category.errors[:name], 'no validation error for name present'
  end

end
