module RequestMacros
  def login_admin
      @request.env["devise.mapping"] = Devise.mappings[:admin]
      sign_in FactoryGirl.create(:admin) # Using factory girl as an example
  end

  def login_user
    user = FactoryGirl.build(:user)
    
    if !User.find_by_email(user.email)
     user = FactoryGirl.create(:user)
    end
    
     fill_in 'user_email', with: user.email
     fill_in 'user_password', with: user.password
     click_on 'Sign in'
  end
end