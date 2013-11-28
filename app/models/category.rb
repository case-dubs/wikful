class Category < ActiveRecord::Base
	has_many :article_categories, through: :articles # this is likely wrong - trying to follow "has-many-through relationship to articles.rb" instruction
	validates :name, :uniqueness: true
end
