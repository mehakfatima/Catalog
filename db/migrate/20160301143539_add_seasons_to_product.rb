class AddSeasonsToProduct < ActiveRecord::Migration
  def self.up
    change_table :products do |t|
       t.belongs_to :season, index:true
    end
  end
end
