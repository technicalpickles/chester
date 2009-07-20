class SheetsController < ResourceController::Base

  index.wants.yaml
  show.wants.yaml
  create.success.flash "Sheet created"
  create.failure.flash "Error creating sheet."
  update.success.flash "Sheet updated"
  update.failure.flash "Error updating sheet."
  
  def recent
    @recent_sheets = Sheet.fifteen_recent
    respond_to do |wants|
      wants.html() { }
      wants.yaml() { }
    end
  end
  
  private
  
  def object
      @object ||= Sheet.find_by_title(params[:id]) || Sheet.find(params[:id])
    end
    
    def collection
      @collection ||= Sheet.alphabetically_by_title
    end
  
end
