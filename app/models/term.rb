class Term < ApplicationRecord
  validates :name, presence: true, length: { maximum: 30 }
  
  belongs_to :user
  scope :resent, -> { order(created_at: :desc) }
end
