require "test_helper"

class GroupeTest < ActiveSupport::TestCase

  def setup
    @groupe = Groupe.new(
      name: "MyGroupe",
      description: "This is just a user groupe."
    )
  end

  test 'valid groupe' do
    assert @groupe.valid?
  end

  test 'invalid without name' do
    @groupe.name = nil
    refute @groupe.valid?, 'saved groupe without a name'
    assert_not_nil @groupe.errors[:name], 'no validation error for name present'
  end

end
