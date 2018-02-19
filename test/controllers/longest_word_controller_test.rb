require 'test_helper'

class LongestWordControllerTest < ActionDispatch::IntegrationTest
  test "should get play" do
    get longest_word_play_url
    assert_response :success
  end

  test "should get showResult" do
    get longest_word_showResult_url
    assert_response :success
  end

end
