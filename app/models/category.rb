class Category < ApplicationRecord
  has_many :galleries, dependent: :destroy
  default_scope { order(order_idx: :asc) }
  validates :name, presence: true, uniqueness: { case_sensitive: false }

  scope :publicly_visible, -> { where(public: true) }

  def self.max_order_idx
    Category.maximum('order_idx')
  end

  def self.min_order_idx
    Category.minimum('order_idx')
  end
end
