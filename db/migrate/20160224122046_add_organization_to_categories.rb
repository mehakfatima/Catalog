class AddOrganizationToCategories < ActiveRecord::Migration
  def change
    add_reference :categories, :organization, index: true
    add_foreign_key :categories, :organizations
  end
end
