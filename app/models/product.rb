class Product < ActiveRecord::Base

  has_attached_file :image, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\Z/

  has_many :product_categories 
  has_many :categories, :through => :product_categories
  
  accepts_nested_attributes_for :product_categories
  accepts_nested_attributes_for :categories
  #belongs_to :author, class_name: 'User'
end
