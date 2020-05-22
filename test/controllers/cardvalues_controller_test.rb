require 'test_helper'

class CardvaluesControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    get cardvalues_create_url
    assert_response :success
  end

end
