class ProductCategory < ActiveRecord::Base
  belongs_to :product
	belongs_to :category
  accepts_nested_attributes_for :product,
    :allow_destroy => true
  accepts_nested_attributes_for :category,
    :allow_destroy => true
end
