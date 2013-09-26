require 'test_helper'

class ParticipantsControllerTest < ActionController::TestCase
  setup do
    @participant = participants(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:participants)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create participant" do
    assert_difference('Participant.count') do
      post :create, participant: { age: @participant.age, bcity: @participant.bcity, college: @participant.college, email: @participant.email, fname: @participant.fname, gender: @participant.gender, lname: @participant.lname, phone: @participant.phone, pid: @participant.pid, teligible: @participant.teligible }
    end

    assert_redirected_to participant_path(assigns(:participant))
  end

  test "should show participant" do
    get :show, id: @participant
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @participant
    assert_response :success
  end

  test "should update participant" do
    put :update, id: @participant, participant: { age: @participant.age, bcity: @participant.bcity, college: @participant.college, email: @participant.email, fname: @participant.fname, gender: @participant.gender, lname: @participant.lname, phone: @participant.phone, pid: @participant.pid, teligible: @participant.teligible }
    assert_redirected_to participant_path(assigns(:participant))
  end

  test "should destroy participant" do
    assert_difference('Participant.count', -1) do
      delete :destroy, id: @participant
    end

    assert_redirected_to participants_path
  end
end
