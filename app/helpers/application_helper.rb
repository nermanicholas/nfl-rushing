module ApplicationHelper
  def sort_link(column:, label:)
    direction = column == sort_column && sort_direction == "asc" ? "desc" : "asc"
    link_to(label, root_path(column: column, direction: direction))
  end
end
