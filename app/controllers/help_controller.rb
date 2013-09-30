class HelpController < ApplicationController
  before_filter :authenticate_user!, except: [:index]
  def index

  end
  def manage
  	@role = current_user[:role]
  end
end
