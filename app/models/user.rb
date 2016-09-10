class User < ApplicationRecord
	has_many :comments
	has_many :articles

	scope :sorted, lambda{order("users.id ASC")}
end
