require 'test_helper'

class FilmListControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get film_list_index_url
    assert_response :success
  end

  test "should get create" do
    get film_list_create_url
    assert_response :success
  end

  test "should get edit" do
    get film_list_edit_url
    assert_response :success
  end

  test "should get update" do
    get film_list_update_url
    assert_response :success
  end

  test "should get new" do
    get film_list_new_url
    assert_response :success
  end

  test "should get destroy" do
    get film_list_destroy_url
    assert_response :success
  end

end
