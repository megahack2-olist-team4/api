require 'test_helper'

class Api::V1::SitesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @site = sites(:one)
  end

  test "should get index" do
    get api_v1_sites_url, as: :json
    assert_response :success
  end

  test "should create site" do
    assert_difference('Site.count') do
      post api_v1_sites_url, params: { site: {  } }, as: :json
    end

    assert_response 201
  end

  test "should show site" do
    get api_v1_site_url(@site), as: :json
    assert_response :success
  end

  test "should update site" do
    patch api_v1_site_url(@site), params: { site: {  } }, as: :json
    assert_response 200
  end

  test "should destroy site" do
    assert_difference('Site.count', -1) do
      delete api_v1_site_url(@site), as: :json
    end

    assert_response 204
  end
end
