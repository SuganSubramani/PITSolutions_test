class Group < ApplicationRecord
	has_many :user_group_roles,:dependent => :destroy
    accepts_nested_attributes_for :user_group_roles, :reject_if => lambda { |a| a[:user_id].blank? }, :allow_destroy => true
	has_many :users, through: :user_group_roles
	validates_presence_of :name
	validate :one_person_should_be_director


	def one_person_should_be_director
		count = 0
		user_group_roles.each do |usr|
			p 'hi'
			p usr
			if usr.role_id.present?
				if usr.role_id == PITConstant::Role::DIRECTOR
					count += 1
				end
			end
		end
		if count > 1
			errors.add(:base, "should be only once")
			errors.add('user_group_roles.role_id', "Each group should contain only one DIRECTOR")
		end
	end
end


