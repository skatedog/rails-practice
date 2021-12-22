class Book < ApplicationRecord
  belongs_to :user

  scope :costly, -> { where('price > ?', 3000) }
  scope :written_about, ->(theme) { where('name like ?', "%#{theme}%") }
end
