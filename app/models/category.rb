class Category < ActiveRecord::Base
  validates :name, uniqueness: true, presence: true

  has_many :product_categories , :dependent => :destroy
  has_many :products, :through => :product_categories
  
  accepts_nested_attributes_for :product_categories
  accepts_nested_attributes_for :products
end

