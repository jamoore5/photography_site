class Category < ApplicationRecord
  has_many :galleries, dependent: :destroy
  validates :name, presence: true, uniqueness: { case_sensitive: false }
end
