class SheetsController < ResourceController::Base
  
  append_before_filter :compensate_for_cheat_gem_params, :only => [ :create, :update ]

  index.wants.yaml
  
  show.wants.yaml
  
  create.success.flash "Sheet created"
  create.failure.flash "Error creating sheet."
  create.wants.yaml do
    response.headers['Location'] = sheet_url(@object)
    render :nothing => true, :status => :created
  end
  
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
    
    def compensate_for_cheat_gem_params
      params[:sheet] ||= {}.with_indifferent_access
      params[:sheet][:title] ||= params[:sheet_title]
      params[:sheet][:body] ||= params[:sheet_body]
    end
  
end
