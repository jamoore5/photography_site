class AddOrderIdxToCategory < ActiveRecord::Migration[5.0]
  def change
    add_column :categories, :order_idx, :integer
  end
end
