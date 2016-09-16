class Category < ApplicationRecord
	has_many :sub_categories
	has_many :articles, :through => :sub_category

	# for nested form
	accepts_nested_attributes_for :sub_categories, :allow_destroy => true
end
