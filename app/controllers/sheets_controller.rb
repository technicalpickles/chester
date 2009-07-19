class SheetsController < ResourceController::Base
  create.flash "Sheet created"
  update.flash "Sheet updated"
  index.wants.yaml
  show.wants.yaml
  
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
