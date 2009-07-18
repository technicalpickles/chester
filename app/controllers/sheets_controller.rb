class SheetsController < ResourceController::Base
  create.flash "Sheet created"
  update.flash "Sheet updated"
  index.before do
    @recent_sheets = Sheet.recent
  end
end
