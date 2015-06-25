require 'test_helper'

class ContactControllerTest < ActionController::TestCase
  setup do
    @controller = ContactsController.new
  end

  test "should get new" do
    get :new
    assert_response :success
  end

end
