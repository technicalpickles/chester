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
  
  module Importer
    
    # Fetches YAML from http://cheats.errtheblog.com
    class ErrTheBlog
      
      ALL_CHEATS_URI = 'http://cheats.errtheblog.com/ya/'
      ALL_CHEATS_YAML_KEY = 'All Cheat Sheets'
      
      ONE_CHEAT_URI = 'http://cheats.errtheblog.com/y/%s'
      
      # @returns an Array of { :title => title, :body => body } hashes
      def import_all
        all_cheat_names.map { |title| import(title) }
      end

      # @returns a single { title => body } hash
      def import(title)
        title, body = load_yaml_from_uri(ONE_CHEAT_URI % [title]).entries.first
        Sheet.create!(:title => title, :body => body).tap do |sheet|
          Sheet.logger.info "Imported cheat sheet #{sheet.title} from cheats.errtheblog.com"
        end
      end
      
      private
      
      def load_yaml_from_uri(uri)
        YAML.load(Net::HTTP.get(URI.parse(uri)))
      end
      
      def all_cheat_names
        load_yaml_from_uri(ALL_CHEATS_URI)[ALL_CHEATS_YAML_KEY]
      end
      
    end
    
    # Fetches YAML from a directory
    class Directory
      
      def initialize(dir)
        @dir = File.expand_path(dir)
      end
      
      # @returns an Array of Sheets, one for each .yml file
      # in this Importer's directory.
      def import_all
        Dir.glob("#{@dir}/**/*.yml").map do |f|
          import File.new(f)
        end
      end
      
      # +file+: a File
      #
      # @returns a newly-created Sheet from the given +file+.
      def import(file)
        title, body = YAML.load(file).entries.first
        Sheet.create!(:title => title, :body => body).tap do |sheet|
          Sheet.logger.info "Imported cheat sheet #{sheet.title} from #{file.path}"
        end
      end
      
    end
    
  end
  
end
