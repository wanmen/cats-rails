module ApplicationHelper
=begin
  def qualified_to_edit? (thing, user, role= SUPERADMIN)
		to_be_returned= false
		if !(user&&thing)
			return false
		elsif user[:id] == thing[:user_id]
			to_be_returned= true
		elsif user[:role] >= role
			to_be_returned= true
		end
		return to_be_returned
	end
	def qualified_to_create? (user, role= SUPERADMIN)
		if !user
			return false
		elsif user[:role] >= role
			return true
		else
			return false
		end
	end
	def at_least_SCHOLAR_or_redirect
		if !qualified_to_create?(current_user,SCHOLAR)
			redirect_to help_manage_path, notice: '您没有权限进行此操作'
		end
	end
	def at_least_ADMIN_or_redirect
		if !qualified_to_create?(current_user,ADMIN)
			redirect_to help_manage_path, notice: '您没有权限进行此操作'
		end
	end
	def at_least_SUPERADMIN_or_redirect
		if !qualified_to_create?(current_user,SUPERADMIN)
			redirect_to help_manage_path, notice: '您没有权限进行此操作'
		end
  end
=end

  def confirm_user_access(target, type, action)
    # info has format [minimun_access, refuse_access_message]
    info = PRIVILEGE[type][action]

    if current_user[:role] < info[0]
      if action == 'new'
        target = help_manage_url
      elsif action == 'create'
        target = new_list_url
      end
      redirect_to target, notice: info[1]
    elsif (action=='edit' || action=='update')
      if (target[:user_id] != current_user[:id] && current_user[:role] != SUPERADMIN)
        redirect_to target, notice: '您没有权限编辑此内容'
      end
    end
  end

end
