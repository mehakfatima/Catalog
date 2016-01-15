class CreateGalleries < ActiveRecord::Migration
  def change
    create_table :galleries do |t|
      t.string :description
      t.string :image
      t.belongs_to :product, index:true 
      t.timestamps null: false
    end
  end
end
