class Address < ApplicationRecord
  belongs_to :user

  validates :address1, presence: true, length: { maximum: 120 }
  validates :city, presence: true, length: { maximum: 120 }
  validates :district, presence: true, length: { maximum: 100 }
  validates :suburb, presence: true, length: { maximum: 100 }
  validates :post_code, presence: true, length: { maximum: 16 }
end
