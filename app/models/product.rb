class Product < ActiveRecord::Base

  validates_presence_of :name
  has_many :galleries, :dependent => :destroy
  has_many :product_categories , :dependent => :destroy
  has_many :categories, :through => :product_categories 
  
  accepts_nested_attributes_for :product_categories
  accepts_nested_attributes_for :categories
  #belongs_to :author, class_name: 'User'
end
