class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController
  def weibo
    # You need to implement the method below in your model (e.g. app/models/user.rb)
    @user = User.find_for_weibo_oauth(request.env["omniauth.auth"], current_user)

    if @user.persisted?
      sign_in_and_redirect @user, :event => :authentication #this will throw if @user is not activated
      set_flash_message(:notice, :success, :kind => "微博") if is_navigational_format?
    else
      session["devise.social_data"] = request.env["omniauth.auth"].except("extra")
      redirect_to new_user_registration_url, notice: '微博登陆成功,请绑定您的邮箱完成注册'
    end
  end
  def renren
    # You need to implement the method below in your model (e.g. app/models/user.rb)
    @user = User.find_for_renren_oauth(request.env["omniauth.auth"], current_user)

    if @user.persisted?
      sign_in_and_redirect @user, :event => :authentication #this will throw if @user is not activated
      set_flash_message(:notice, :success, :kind => "人人") if is_navigational_format?
    else
      session["devise.social_data"] = request.env["omniauth.auth"]  
      redirect_to new_user_registration_url, notice: '人人登陆成功,请绑定您的邮箱完成注册'
    end
  end
  def douban
    # You need to implement the method below in your model (e.g. app/models/user.rb)
    @user = User.find_for_douban_oauth(request.env["omniauth.auth"], current_user)

    if @user.persisted?
      sign_in_and_redirect @user, :event => :authentication #this will throw if @user is not activated
      set_flash_message(:notice, :success, :kind => "豆瓣") if is_navigational_format?
    else
      session["devise.social_data"] = request.env["omniauth.auth"]
      redirect_to new_user_registration_url, notice: '豆瓣登陆成功,请绑定您的邮箱完成注册'
    end
  end
  def qq_connect
    # You need to implement the method below in your model (e.g. app/models/user.rb)
    @user = User.find_for_qq_oauth(request.env["omniauth.auth"], current_user)

    if @user.persisted?
      sign_in_and_redirect @user, :event => :authentication #this will throw if @user is not activated
      set_flash_message(:notice, :success, :kind => "QQ") if is_navigational_format?
    else
      session["devise.social_data"] = request.env["omniauth.auth"]
      redirect_to new_user_registration_url, notice: 'QQ登陆成功，请绑定您的邮箱完成注册'
    end
  end
end