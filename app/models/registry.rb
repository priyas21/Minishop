class Registry < ApplicationRecord
  validates :address, presence: true
  validates :icp, presence: true, length: { is: 9 }
end
