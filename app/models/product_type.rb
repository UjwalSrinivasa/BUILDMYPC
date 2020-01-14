class ProductType < ApplicationRecord
	has_many :products , dependent: :destroy, :foreign_key => :value, :primary_key => :value
	before_save { name.upcase! }
	validates :name,  presence: true, length: { maximum: 25, minimum: 3 }, uniqueness: { case_sensitive: false } 
	validates :value, presence: true, uniqueness: true, exclusion: { in: [0] }
end
