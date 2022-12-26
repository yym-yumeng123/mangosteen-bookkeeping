class Tag < ApplicationRecord
  belongs_to :user

  validates :name, presence: true
  validates :sign, presence: true
end
