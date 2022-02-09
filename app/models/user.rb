class User < ApplicationRecord
  has_many :orders, dependent: :destroy

  PROPERTIES = %i(name email password password_confirmation).freeze
  before_save :downcase_email

  validates :name, presence: true,
    length: {maximum: Settings.digit_50}
  validates :email, presence: true,
    length: {maximum: Settings.digit_255},
    format: {with: Settings.email_regex},
    uniqueness: {case_sensitive: false}
  validates :password, presence: true,
    length: {minimum: Settings.digit_6},
    allow_nil: true
  has_secure_password

  private

  def downcase_email
    email.downcase!
  end
end
