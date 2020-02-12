require 'test_helper'

class ItemsControllerTest < ActionDispatch::IntegrationTest
  test "should get sell" do
    get items_sell_url
    assert_response :success
  end

end
