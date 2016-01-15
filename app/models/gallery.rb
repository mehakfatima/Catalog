class Gallery < ActiveRecord::Base
    
  belongs_to :product
 
  has_attached_file :image, 
    styles: { medium: "300x300>", thumb: "100x100>" }, 
#    :path => ":rails_root/public/images/:id/:filename",
    default_url: "/images/missing.png"
  
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\Z/

  do_not_validate_attachment_file_type :image
end
