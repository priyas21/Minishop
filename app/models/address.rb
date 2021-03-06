class Address < ApplicationRecord
  belongs_to :user
  belongs_to :icp

  accepts_nested_attributes_for :icp
  after_initialize do
    self.icp ||= self.build_icp()
  end

  validates :address1, presence: true
  validates :city, presence: true
  validates :district, presence: true
  validates :suburb, presence: true
  validates :post_code, presence: true
end
