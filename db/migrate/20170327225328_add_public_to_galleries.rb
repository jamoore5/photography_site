class AddPublicToGalleries < ActiveRecord::Migration[5.0]
  def change
    add_column :galleries, :public, :boolean, :default => true
  end
end
