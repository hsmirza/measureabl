class Insight < ApplicationRecord
  belongs_to :insightable, polymorphic: true
end
