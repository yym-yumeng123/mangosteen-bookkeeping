class Tag < ApplicationRecord
  paginates_per 25
  belongs_to :user
  enum kind: { expenses: 1, income: 2}

  validates :name, presence: true
  validates :sign, presence: true
end
