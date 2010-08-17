class Comment < ActiveRecord::Base
	acts_as_nested_set :scope => :product
	belongs_to :product
	validates_presence_of :name, :body, :product_id
end
