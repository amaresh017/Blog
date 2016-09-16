class Article < ApplicationRecord

	has_many :comments
	belongs_to :user
	has_and_belongs_to_many :sub_categories
  # to tag multiple subcategories with an article.
	accepts_nested_attributes_for :sub_categories, :allow_destroy => false
end
