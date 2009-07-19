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
  
  def self.import(importable)
    thing_to_load = if importable.kind_of? String
                      Net::HTTP.get(URI.parse("http://cheat.errtheblog.com/y/#{importable}"))
                    else
                      importable
                    end
    
    yaml = YAML.load(thing_to_load)
    
    title, body = yaml.entries.first
    Sheet.create! :title => title, :body => body
  end
  
  def self.import_all
    yaml = YAML.load(Net::HTTP.get(URI.parse('http://cheat.errtheblog.com/ya/')))
    sheets = yaml['All Cheat Sheets']
    sheets.map { |s| import s }
  end
  
end
