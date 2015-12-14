require 'test_helper'

class HomeControllerTest < ActionController::TestCase 
  include Devise::TestHelpers
  test "should get home" do
    get :home
    assert_response :success

    assert_template layout: 'application'

    assert_select 'title', 'Music Application'
    assert_select 'h1', 'Musify'
    assert_select 'p', 'Welcome to the application!'

  end

  test "should get contact" do
    get :contact
    assert_response :success
    assert_template layout: 'application'
    assert_select 'title', 'My Notes'
    assert_select 'h1', 'Contact Us'
    assert_select 'p', 'Complete the following form to get in touch with us.'
  end

  test "should post request contact but no email" do
    post :request_contact
    assert_response :redirect
    assert_not_empty flash[:alert]
    assert_nil flash[:notice]
  end

  test "should post request contact" do
    post :request_contact,
      name: "Kusal Gurung", email: "kusalgurung@hotmail.com",
      telephone: "1234567890", message: "I was not able to add a album"
    assert_response :redirect
    assert_nil flash[:alert]
    assert_not_empty flash[:notice]
  end

end
