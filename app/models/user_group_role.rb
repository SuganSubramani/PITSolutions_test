class UserGroupRole < ApplicationRecord
	belongs_to :group
	belongs_to :user
	Roles = {
		"Director" => PITConstant::Role::DIRECTOR,
		"Assistant Director" => PITConstant::Role::ASSISTANT_DIRECTOR,
		"Member" => PITConstant::Role::MEMBER
	}

	validates_presence_of :user_id, :role_id
	validates :user_id, uniqueness: { scope: :role_id }
	# validates_uniqueness_of :user_id, scope: [:role_id,:group_id], :message => "user and role combination should be only once"
end
