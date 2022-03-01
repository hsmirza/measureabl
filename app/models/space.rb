class Space < ApplicationRecord
  belongs_to :site

  after_save :update_stats

  enum space_type: { commercial: 0, residential: 1, common: 2 }

  private

  def update_stats
    update_insight(site.insight || site.build_insight)
    update_insight(site.portfolio.insight || site.portfolio.build_insight)
  end

  def update_insight(insight)
    space_type_attr = "#{space_type}_area"
    total_area = insight.total_area + area
    space_type_area = insight.send(space_type_attr) + area

    insight.update!(space_type_attr => space_type_area, total_area: total_area)
  end
end
