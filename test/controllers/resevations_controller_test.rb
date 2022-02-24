require "test_helper"

class ResevationsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get resevations_index_url
    assert_response :success
  end
end
