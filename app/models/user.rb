class User < ApplicationRecord
  before_save { self.email = email.downcase if email.present? }

  validates :name, length: { minimum: 1, maximum: 100 }, presence: true
  validates :password, presence: true, length: { minimum: 4 }, unless: :password_digest
  validates :password, length: { minimum: 4 }, allow_blank: true
  validates :email,
            presence: true,
            uniqueness: { case_sensitive: false },
            length: { minimum: 3, maximum: 254 }

  has_secure_password
end
