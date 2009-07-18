class SheetsController < ResourceController::Base
  create.flash "Sheet created"
  update.flash "Sheet updated"
end
