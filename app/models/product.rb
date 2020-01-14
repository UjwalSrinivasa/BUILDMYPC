class Product < ApplicationRecord
	belongs_to :product_type, :foreign_key => :value, :primary_key => :value
	mount_uploader :image, ImageUploader
	validates :name,  presence: true, length: { maximum: 50 }, uniqueness: { case_sensitive: true } 
	validates :value, presence: true
	validates :description, presence: true, length: { minimum: 10 }
	validates :specification, presence: true, length: {minimum: 20 }
	validates :price, presence: true
end
