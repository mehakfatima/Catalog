class ProductCategory < ActiveRecord::Base
  belongs_to :product, dependent: :destroy
  belongs_to :category, dependent: :destroy
  accepts_nested_attributes_for :product,
    :allow_destroy => true
  accepts_nested_attributes_for :category,
    :allow_destroy => true
end
