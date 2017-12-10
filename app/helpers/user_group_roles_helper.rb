module UserGroupRolesHelper
	def role_text(string)
		case string
		when PITConstant::Role::DIRECTOR
			return "Director"
		when PITConstant::Role::ASSISTANT_DIRECTOR
			return "Assistant Director"
		when PITConstant::Role::MEMBER
			return "Member"
		else
			return ""
		end
	end
end