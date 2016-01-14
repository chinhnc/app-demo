require 'test_helper'

class UserTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

  def setup
    @user = User.new(name: "Example User234213421", email: "user1234234@gmail.com", activated:true)
  end
  test "should be valid" do
    assert @user.valid?
  end
end
