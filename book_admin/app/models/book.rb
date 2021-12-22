class Book < ApplicationRecord
  enum sales_status: {
    reservation: 0,
    now_on_sale: 1,
    end_of_print: 2,
  }

  belongs_to :user

  validates :name, presence: true, length: { maximum: 25 }
  validates :price, numericality: { greater_then_or_equal_to: 0 }

  scope :costly, -> { where('price > ?', 3000) }
  scope :written_about, ->(theme) { where('name like ?', "%#{theme}%") }
end
