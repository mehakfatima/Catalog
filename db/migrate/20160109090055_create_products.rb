class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|

      t.string :name
      t.string :serial_number
      t.belongs_to :organization, index:true
      t.timestamps null: false

      t.timestamps null: false
    end
  end
end
