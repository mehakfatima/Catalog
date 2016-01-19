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
  has_many :categories, :through => :product_categories 
  belongs_to :organization
  accepts_nested_attributes_for :product_categories
  accepts_nested_attributes_for :categories

  def organization_name
    if self.organization.present?
      organization.name
    end
  end
  
  
  
  # Naive approach
  def self.rebuild_pg_search_documents
    find_each { |record| record.update_pg_search_document }
  end

  # More sophisticated approach
  def self.rebuild_pg_search_documents
    connection.execute <<-SQL
     INSERT INTO pg_search_documents (searchable_type, searchable_id, content, created_at, updated_at)
       SELECT 'Movie' AS searchable_type,
              movies.id AS searchable_id,
              (movies.name || ' ' || directors.name) AS content,
              now() AS created_at,
              now() AS updated_at
       FROM movies
       LEFT JOIN directors
         ON directors.id = movies.director_id
    SQL
  end
end
