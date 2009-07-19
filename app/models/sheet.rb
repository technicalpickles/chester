class Sheet < ActiveRecord::Base

  named_scope :alphabetically_by_title, :order => 'title ASC'
  
  named_scope :reverse_chronological, :order => 'updated_at DESC'
  
  named_scope :limited, lambda { |n| { :limit => n } }
  
  def self.fifteen_recent
    self.reverse_chronological.limited(15).to_a
  end
  
  def inspect
    title
  end
  
end
