class Category < ApplicationRecord
  PROPERTIES = %i(name desc).freeze

  has_many :books, dependent: :nullify

  scope :recent_add, ->{order created_at: :desc}

  validates :name, presence: true,
    length: {maximum: Settings.max_name}
  validates :desc, presence: true,
    length: {maximum: Settings.max_desc}
end
