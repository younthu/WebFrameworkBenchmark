require 'test_helper'

class TimeProvidersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @time_provider = time_providers(:one)
  end

  test "should get index" do
    get time_providers_url, as: :json
    assert_response :success
  end

  test "should create time_provider" do
    assert_difference('TimeProvider.count') do
      post time_providers_url, params: { time_provider: { short_string: @time_provider.short_string, stamp: @time_provider.stamp } }, as: :json
    end

    assert_response 201
  end

  test "should show time_provider" do
    get time_provider_url(@time_provider), as: :json
    assert_response :success
  end

  test "should update time_provider" do
    patch time_provider_url(@time_provider), params: { time_provider: { short_string: @time_provider.short_string, stamp: @time_provider.stamp } }, as: :json
    assert_response 200
  end

  test "should destroy time_provider" do
    assert_difference('TimeProvider.count', -1) do
      delete time_provider_url(@time_provider), as: :json
    end

    assert_response 204
  end
end
