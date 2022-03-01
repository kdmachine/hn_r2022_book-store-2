class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true

  scope :search, ->(term){where("name LIKE ?", "%#{term}%") if term.present?}
end
