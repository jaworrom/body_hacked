require 'test_helper'

class HackTipsControllerTest < ActionController::TestCase
  setup do
    @hack_tip = hack_tips(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:hack_tips)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create hack_tip" do
    assert_difference('HackTip.count') do
      post :create, hack_tip: { description: @hack_tip.description, title: @hack_tip.title, user_id: @hack_tip.user_id }
    end

    assert_redirected_to hack_tip_path(assigns(:hack_tip))
  end

  test "should show hack_tip" do
    get :show, id: @hack_tip
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @hack_tip
    assert_response :success
  end

  test "should update hack_tip" do
    patch :update, id: @hack_tip, hack_tip: { description: @hack_tip.description, title: @hack_tip.title, user_id: @hack_tip.user_id }
    assert_redirected_to hack_tip_path(assigns(:hack_tip))
  end

  test "should destroy hack_tip" do
    assert_difference('HackTip.count', -1) do
      delete :destroy, id: @hack_tip
    end

    assert_redirected_to hack_tips_path
  end
end
