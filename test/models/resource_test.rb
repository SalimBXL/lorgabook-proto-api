require "test_helper"

class ResourceTest < ActiveSupport::TestCase

  def setup
    @resource_category = ResourceCategory.new(
      name: 'Ressource Cat1', 
      description: "Just a simple resource category.", 
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
  end

  test 'valid resource category' do
    assert @resource.valid?
  end

  test 'invalid without name' do
    @resource.name = nil
    refute @resource.valid?, 'saved resource without a name'
    assert_not_nil @resource.errors[:name], 'no validation error for name present'
  end

  test 'invalid without category' do
    @resource.resource_category = nil
    refute @resource.valid?, 'saved resource without a category'
    assert_not_nil @resource.errors[:resource_category], 'no validation error for resource category present'
  end

  test 'invalid without location' do
    @resource.resource_location = nil
    refute @resource.valid?, 'saved resource without a locaton'
    assert_not_nil @resource.errors[:resource_location], 'no validation error for resource location present'
  end

  test 'invalid without reference person' do
    @resource.reference_person = nil
    refute @resource.valid?, 'saved resource without a reference person'
    assert_not_nil @resource.errors[:reference_person], 'no validation error for reference person present'
  end

end
