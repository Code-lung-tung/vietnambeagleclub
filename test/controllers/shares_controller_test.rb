require 'test_helper'

class SharesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get shares_index_url
    assert_response :success
  end

end
