class Gallery < ActiveRecord::Base
    
  belongs_to :product
 
  has_attached_file :image, 
    styles: { croppable: '600x600>', medium: "400x400>", thumb: "100x100>" }, 
    :storage => :s3,
    :bucket => "catalog-mehak"

  validates_attachment_content_type :image, content_type: /\Aimage\/.*\Z/

  do_not_validate_attachment_file_type :image
end
