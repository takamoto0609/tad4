require 'test_helper'

class FieldsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get fields_new_url
    assert_response :success
  end

end
