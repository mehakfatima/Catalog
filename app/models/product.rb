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
                
  
  validates_presence_of :name
  has_many :galleries, :dependent => :destroy
  has_many :product_categories , :dependent => :destroy
  has_many :categories, :through => :product_categories, dependent: :destroy
  belongs_to :organization
  belongs_to :season
  accepts_nested_attributes_for :product_categories
  accepts_nested_attributes_for :categories

  def organization_name
    if self.organization.present?
      organization.name
    end
  end
  
  def season_name
    if self.season.present?
      season.name
    end
  end
end
