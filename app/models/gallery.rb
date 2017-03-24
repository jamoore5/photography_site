class Gallery < ApplicationRecord
  belongs_to :category
  default_scope { order(order_idx: :asc) }

  def self.max_order_idx(category_id)
    Gallery.where(category_id: category_id).maximum('order_idx')
  end

  def self.min_order_idx(category_id)
    Gallery.where(category_id: category_id).minimum('order_idx')
  end
end
