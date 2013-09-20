module Capybara
  module DSL

    def complete_facebook_dialogues_on_click(element, test_user)
      # until bookface version bumped to latest we have no way to know its ready so delay, not ideal
      sleep 2
      find("#{element}").click
      return if page.driver.browser.window_handles.length == 1
      within_window page.driver.browser.window_handles.last do
        fill_in_facebook_form(test_user) if page.has_css?('#loginbutton')
        accept_permissions_outside_facebook
      end
    end

    def login_and_authorise_app_outside_facebook(test_user)
      within_window('Facebook') do
        fill_in_facebook_form(test_user) if page.has_css?('#loginbutton')
        accept_permissions_outside_facebook
      end
    end

    def accept_additional_permissions
      return if page.driver.browser.window_handles.length == 1
      within_window page.driver.browser.window_handles.last do
        accept_permissions_outside_facebook
      end
    end

    def accept_permissions_outside_facebook
      # these checks are required as the flow cna change depending on if the user has authed before 
      # read permissions dialogue
      # click_on('OK') if page.driver.browser.window_handles.length == 2
      if page.driver.browser.window_handles.length >= 2
        read_perms = first(:xpath, "//button[@name='__CONFIRM__']") 
        read_perms.click unless read_perms.nil?
      end

      if page.driver.browser.window_handles.length >= 2
        write_perms = first(:xpath, "//button[@name='__CONFIRM__']") 
        write_perms.click unless write_perms.nil?
      end

      # write permision dialogue
      # click_on('OK') if page.driver.browser.window_handles.length == 2
    end

    def login_to_facebook_homepage(test_user, after_login_url)
      fill_in_facebook_form(test_user)
      visit after_login_url
    end

    def deauth_app
      sleep 1
      page.execute_script %Q{
         FB.api("/me/permissions","DELETE", function(response){
           console.log(response)
         });
       }
      sleep 1
    end

    def logout
      sleep 1
      page.execute_script %Q{
        FB.logout(function(response) {
          // user is now logged out
        });
       }
      sleep 1
    end

    def fill_in_facebook_form(test_user)
      if test_user.class == Hash
        test_user = OpenStruct.new test_user
      end
      
      fill_in('email', :with => "#{test_user.email}") 
      fill_in('pass', :with => "#{test_user.password}")
      find('#loginbutton').click
    end    
  end
end