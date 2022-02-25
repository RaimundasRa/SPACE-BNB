class Colony < ApplicationRecord
  belongs_to :user
  has_one_attached :photo
  has_many :bookings, dependent: :destroy

  include PgSearch::Model
  pg_search_scope :global_search,
                  against: [:name, :description, :location],
                  using: { tsearch: { prefix: true } }
end
