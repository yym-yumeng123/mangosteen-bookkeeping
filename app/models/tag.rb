class Tag < ApplicationRecord
  paginates_per 25
  belongs_to :user
  enum kind: { expenses: 1, income: 2}

  validates :name, length: { maximum: 4 }
  validates :name, presence: true
  validates :sign, presence: true
  validates :kind, presence: true

  def self.default_scope
    where(deleted_at: nil)
  end
end
