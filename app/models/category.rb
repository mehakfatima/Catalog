class Category < ActiveRecord::Base
  validates :name, uniqueness: true, presence: true

  has_many :product_categories , :dependent => :destroy
  has_many :products, :through => :product_categories, :dependent => :destroy
  belongs_to :organization
  
  accepts_nested_attributes_for :product_categories
  accepts_nested_attributes_for :products

  def organization_name
    if self.organization.present?
      organization.name
    end
  end
end

