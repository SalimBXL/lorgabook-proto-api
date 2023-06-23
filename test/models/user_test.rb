require "test_helper"

class UserTest < ActiveSupport::TestCase

  def setup
    @groupe = Groupe.new(name: "MyGroupe")
    @user = User.new(
      fullname: 'John', 
      email: 'john@example.com', 
      groupe: @groupe
    )
  end

  test 'valid user' do
    assert @user.valid?
  end

  test 'invalid without name' do
    @user.fullname = nil
    refute @user.valid?, 'saved user without a name'
    assert_not_nil @user.errors[:fullname], 'no validation error for name present'
  end

  test 'invalid without email' do
    @user.email = nil
    refute @user.valid?, 'saved user without an email'
    assert_not_nil @user.errors[:email], 'no validation error for email present'
  end

  test 'invalid without groupe' do
    @user.groupe = nil
    refute @user.valid?, 'saved user without a groupe'
    assert_not_nil @user.errors[:groupe], 'no validation error for groupe present'
  end
end
