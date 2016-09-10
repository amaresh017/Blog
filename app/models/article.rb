class Article < ApplicationRecord

	has_many :comments
	belongs_to :user
	has_and_belongs_to_many :sub_categories
end
