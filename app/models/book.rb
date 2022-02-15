class Book < ApplicationRecord
  PROPERTIES = [:name, :desc, :nopage, :quantity, :price,
                :publisher_id, :category_id,
                book_authors: [], images: []].freeze

  scope :recent_add, ->{order created_at: :desc}

  belongs_to :publisher
  belongs_to :category
  has_many :order_details, dependent: :nullify
  has_many :orders, through: :order_details
  has_many :book_authors, dependent: :destroy
  has_many :authors, through: :book_authors
  has_many_attached :images

  delegate :name, to: :publisher, prefix: true
  delegate :name, to: :category, prefix: true

  validates :name, presence: true,
    length: {maximum: Settings.max_name}
  validates :desc, presence: true,
    length: {maximum: Settings.max_desc}
  validates :nopage, presence: true,
    numericality: {only_integer: true, greater_than: Settings.zero}
  validates :quantity, presence: true,
    numericality: {only_integer: true, greater_than_or_equal_to: Settings.zero}
  validates :price, presence: true,
    numericality: {only_integer: true, greater_than: Settings.zero}
  validates :images,
            content_type: {
              in: Settings.image_type,
              message: I18n.t("invalid_image_type")
            },
            size: {
              less_than: Settings.image_size.megabytes,
              message: I18n.t("invalid_image_size")
            }
end
