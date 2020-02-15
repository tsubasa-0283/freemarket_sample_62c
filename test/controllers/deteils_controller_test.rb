require 'test_helper'

class DeteilsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get deteils_index_url
    assert_response :success
  end

end
