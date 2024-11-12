class Event < ApplicationRecord
  after_create :log_creation

  validates :name, presence: true, uniqueness: true    # Requiere que name sea único y no esté vacío
  validates :description, presence: true               # Requiere que description no esté vacío
  validates :date, presence: true                      # Requiere que date no esté vacío

  scope :concert_filter, -> {where('description LIKE ?', '%concert%'  ).all}

  def log_creation
    Rails.logger.info "Event #{name} was created at #{created_at}"
  end
end
