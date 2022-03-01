class Portfolio < ApplicationRecord
  has_many :sites
  has_one :insight, as: :insightable
end
