require 'test_helper'

class ContactMailerTest < ActionMailer::TestCase
 test "should return contact email" do
	mail = ContactMailer.contact_email("kusalgurung@hotmail.com",
	"Kusal Gurung", "1234567890", @message = "I was not able to add a album")
	assert_equal ['info@musify.com'], mail.to
	assert_equal ['info@musify.com'], mail.from
 end
end
