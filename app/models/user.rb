class User < ApplicationRecord
  has_many :addresses
  before_save { self.email = email.downcase }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z+]+\z/i

  validates :first_name, presence: true, length: { maximum: 50 }
  validates :last_name, presence: true, length: { maximum: 50 }
  validates :phone, presence: true,
            numericality: true, length: { minimum: 5 , maximum: 15 }
  validates :email, presence: true , length: { maximum: 255},
            format: { with: VALID_EMAIL_REGEX },
            uniqueness: { case_sensitive: false }
end
