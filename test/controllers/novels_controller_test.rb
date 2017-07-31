require 'test_helper'

class NovelsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get novels_index_url
    assert_response :success
  end

  test "should get show" do
    get novels_show_url
    assert_response :success
  end

  test "should get new" do
    get novels_new_url
    assert_response :success
  end

  test "should get edit" do
    get novels_edit_url
    assert_response :success
  end

  test "should get destroy" do
    get novels_destroy_url
    assert_response :success
  end

end
