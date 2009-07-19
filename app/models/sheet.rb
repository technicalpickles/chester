class Sheet < ActiveRecord::Base

  
  named_scope :reverse_chronological, :order => 'updated_at DESC'
  
  named_scope :limited, lambda { |n| { :limit => n } }
  
  def self.fifteen_recent
    self.reverse_chronological.limited(15).to_a
  end
  
  def self.alphabetically_by_title
    find(:all, :order => 'title ASC')
  end
  
  def inspect
    title
  end
  
end
