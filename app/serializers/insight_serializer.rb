class InsightSerializer < ActiveModel::Serializer
  attributes :id, :total_area, :residential_area, :commercial_area, :common_area
end
