class Site < ApplicationRecord
  belongs_to :portfolio
  has_many :spaces
  has_one :insight, as: :insightable
end
