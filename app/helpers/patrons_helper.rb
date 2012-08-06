module PatronsHelper

  def sortable(column, title = nil)
    title ||= column.titleize
    css_class = column == sort_column ? "current " + direction_icon : nil
    direction = column == sort_column && sort_direction == "asc" ? "desc" : "asc"
    link_to title, {:sort => column, :direction => direction}, {:class => css_class}
  end

  def direction_icon(icon = "")
    icon = "icon-chevron-up" if sort_direction == "asc"
    icon = "icon-chevron-down" if sort_direction == "desc"
    # TODO...
    return ""
  end
end
