require "test_helper"

class ResourceLocationTest < ActiveSupport::TestCase

  def setup
    @resource_location = ResourceLocation.new(
      name: 'Labo 1', 
      description: "Laborarory #1", 
    )
  end

  test 'valid resource location' do
    assert @resource_location.valid?
  end

  test 'invalid without name' do
    @resource_location.name = nil
    refute @resource_location.valid?, 'saved resource location without a name'
    assert_not_nil @resource_location.errors[:name], 'no validation error for name present'
  end

end
