class AddPublicToCategories < ActiveRecord::Migration[5.0]
  def change
    add_column :categories, :public, :boolean, :default => true
  end
end
