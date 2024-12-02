class Product < ApplicationRecord
	validates_presence_of :title, :price, :description
	has_many :cart_items, dependent: :destroy
end
