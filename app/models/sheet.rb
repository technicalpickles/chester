class Sheet < ActiveRecord::Base
  
  def self.recent
    r = all.reject { |sheet| sheet.updated_at < 3.weeks.ago }
    newest = r.sort_by(&:updated_at).last
    newest = [newest] + (r - [newest]).sort {|x, y| y.updated_at <=> x.updated_at}
    newest[0..14].compact
  end
  
  def inspect
    title
  end
  
end
