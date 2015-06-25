require 'test_helper'

class ReservationControllerTest < ActionController::TestCase
  setup do
    @controller = ReservationsController.new
  end
  test "should get new" do
    get :new
    assert_response :success
  end

end
