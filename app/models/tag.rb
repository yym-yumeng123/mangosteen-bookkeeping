class Tag < ApplicationRecord
  belongs_to :user
  enum kind: { expenses: 1, income: 2}

  validates :name, presence: true
  validates :sign, presence: true
end
