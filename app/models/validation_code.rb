class ValidationCode < ApplicationRecord
  # has_secure_token :code, length: 24
  validates_presence_of :email
end
