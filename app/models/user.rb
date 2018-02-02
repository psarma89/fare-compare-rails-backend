class User < ApplicationRecord
  has_secure_password

  validates :email, presence: true
  validates :password, presence: true

  validates :email, uniqueness: true
  validates_format_of :email, :with => /\A[^@]+@([^@\.]+\.)+[^@\.]+\z/


end
