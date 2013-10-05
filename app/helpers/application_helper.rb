module ApplicationHelper
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
end
