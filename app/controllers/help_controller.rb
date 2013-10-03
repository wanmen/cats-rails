class HelpController < ApplicationController
  before_filter :authenticate_user!, except: [:index]
  def index

  end
  def manage
  	@role = current_user[:role]
  	if (current_user[:role]== SUPERADMIN)
  		@users = User.all
  	end
  end

  def apply
    @role = current_user[:role]
    if (@role == BEGINNER)
    	current_user[:role]=PRESCHOLAR
    	respond_to do |format|
	    	if current_user.save
		        format.html { redirect_to :back, notice: '申请成功提交' }
		    else
		        format.html { redirect_to :back, notice: '申请失败' }
		    end
		end
    elsif (@role == SUPERADMIN)
    	@user = User.find(params[:user_id])
    	@user.role = params[:role]
    	respond_to do |format|
	    	if @user.save
		       format.html { redirect_to :back, notice: '成功修改权限' }
		    else
		       format.html { redirect_to :back, notice: '修改权限失败' }
		    end
		end
	 elsif (@role == SCHOLAR)
		current_user[:role]=PREADMIN
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
