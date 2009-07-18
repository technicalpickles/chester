module ModelHelpers
  
  def the_sheet_titled(title)
    Sheet.find_or_create_by_title(title)
  end
  
end

World(ModelHelpers)