class Category < ActiveRecord::Base
  validates_presence_of :name
  
  validates :name, uniqueness: { message: "Category is already present" }, presence: true 
  has_many :product_categories 
  has_many :products, :through => :product_categories
  
  accepts_nested_attributes_for :product_categories
  accepts_nested_attributes_for :products
end

