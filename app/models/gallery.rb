class Gallery < ApplicationRecord
  belongs_to :category
  has_many :photos, dependent: :destroy
  default_scope { order(order_idx: :asc) }
  validates :name, presence: true, uniqueness: { case_sensitive: false }

  def self.max_order_idx(category_id)
    Gallery.where(category_id: category_id).maximum('order_idx')
  end

  def self.min_order_idx(category_id)
    Gallery.where(category_id: category_id).minimum('order_idx')
  end
end
