class HelpController < ApplicationController
  before_filter :authenticate_user!, except: [:index]
  def index

  end
  def manage
  	@role = current_user[:role]
  end

  def apply
    @role = current_user[:role]
    if (@role == 0)
    	current_user[:role]=1
    	current_user.save
    end
    render :manage
  end
end
