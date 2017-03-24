class AddOrderIdxToGalleries < ActiveRecord::Migration[5.0]
  def change
    add_column :galleries, :order_idx, :integer
  end
end
