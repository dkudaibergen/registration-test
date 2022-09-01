Given "Register with temp mail" do
  driver.navigate.to "http://www.google.com"

end


When "try to open another browser" do
  driver2.navigate.to "https://temp-mail.org/en/"
  sleep 10
end

Then "scan email" do
  doc = driver2.page_source
  # r = Regexp.new(/\b[a-zA-Z0-9._%+-]+@[a-zA-Z0-9._]+\.[a-zA-z]{2,4}\b/)
  element = driver2.find_element(:id, 'mail')
  @email = nil
  if element
    @email = element.attribute("value")
  end
  # @email = doc.scan(r).uniq
  puts "PRINTING OUT THE SCANNED EMAIL", @email
  # puts "ELEMENT WHICH WAS FOUND ", element
end

When ('go to register page')do
  driver.navigate.to "https://partner-qa.enjoyyit.com/register?locale=en"
  sleep 2
end


When "r_email" do
  driver.find_element(:id, 'user_email').send_keys(@email)
  sleep 1
end

When "r_pass" do
  driver.find_element(:id, 'user_password').send_keys('123456')
  sleep 1
end

When "r_pass2" do
  driver.find_element(:id, 'user_password_confirmation').send_keys('123456')
  sleep 1
end


And "terms" do
  driver.find_element(:id, 'user_terms_and_conditions_consent').click
end

And "privacy" do
  driver.find_element(:id, 'user_privacy_policy_consent').click
end

And "profiling" do
  driver.find_element(:id, 'user_profiling_consent').click
  sleep 1
end

Then "click register btn" do
  driver.find_element(:name, 'commit').click
  sleep 10

end
# Then "open current mail" do
#   driver2.find_element(:id, 'click-to-refresh').click
#   sleep 20
# end
# And "click confirmation button"do
#   open_email('no-reply@enjoyyit.com')
#   current_email.click_link 'Confirm my account'
And "sign in to your account"do
  driver.find_element(:id,"user_email").send_keys(@email)
  sleep 1
  driver.find_element(:id,"user_password").send_keys('123456')
  sleep 1
  driver.find_element(:name, 'commit').click
  sleep 2
  driver.quit
  driver2.quit
end