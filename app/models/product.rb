class Product < ActiveRecord::Base
  include PgSearch
  pg_search_scope :custom_search,
    :against => [:name , :organization_id],
    :using => {
    :tsearch => {:prefix => true, :dictionary => "english"}
  }, :associated_against => {
    :categories => :id,
    :product_categories => :id
  }
                
  has_many :seasons , :dependent => :destroy
  
  validates_presence_of :name
  has_many :galleries, :dependent => :destroy
  has_many :product_categories , :dependent => :destroy
  has_many :categories, :through => :product_categories 
  belongs_to :organization
  accepts_nested_attributes_for :product_categories
  accepts_nested_attributes_for :categories
  accepts_nested_attributes_for :seasons

  def organization_name
    if self.organization.present?
      organization.name
    end
  end
end
