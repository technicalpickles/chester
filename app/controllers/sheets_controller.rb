class SheetsController < ResourceController::Base
  create.flash "Sheet created"
  update.flash "Sheet updated"
  index.wants.yaml
  
  def recent
    @recent_sheets = Sheet.fifteen_recent
    respond_to do |wants|
      wants.html() { }
      wants.yaml() { }
    end
  end
  
  private
    def collection
      @collection ||= Sheet.alphabetically_by_title
    end
  
end
