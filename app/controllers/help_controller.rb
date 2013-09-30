class HelpController < ApplicationController
  before_filter :authenticate_user!, except: [:index]
  def index

  end
  def manage
  	@role = current_user[:role]
  	if (current_user[:role]== 9)
  		@users = User.all
  	end
  end

  def apply
    @role = current_user[:role]
    if (@role == 0)
    	current_user[:role]=1
    	respond_to do |format|
	    	if current_user.save
		        format.html { redirect_to :back, notice: '申请成功提交' }
		    else
		        format.html { redirect_to :back, notice: '申请失败' }
		    end
		end
    elsif (@role == 9)
    	@user = User.find(params[:user_id])
    	@user.role = params[:role]
    	respond_to do |format|
	    	if @user.save
		       format.html { redirect_to :back, notice: '成功修改权限' }
		    else
		       format.html { redirect_to :back, notice: '修改权限失败' }
		    end
		end
	elsif (@role == 2)
		current_user[:role]=3
    	respond_to do |format|
	    	if current_user.save
		        format.html { redirect_to :back, notice: '申请成功提交' }
		    else
		        format.html { redirect_to :back, notice: '申请失败' }
		    end
		end
    end
  end
end
