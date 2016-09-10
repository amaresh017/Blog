class Category < ApplicationRecord

	has_many :sub_categories
	has_many :articles, :through => :sub_category
end
