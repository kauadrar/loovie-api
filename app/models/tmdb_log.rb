class TmdbLog < ApplicationRecord
  belongs_to :entity, polymorphic: true, optional: true
  has_many :tmdb_errors, dependent: :destroy
end
