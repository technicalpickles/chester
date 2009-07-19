# Add your own tasks in files placed in lib/tasks ending in .rake,
# for example lib/tasks/capistrano.rake, and they will automatically be available to Rake.

require(File.join(File.dirname(__FILE__), 'config', 'boot'))

require 'rake'
require 'rake/testtask'
require 'rake/rdoctask'

require 'tasks/rails'

namespace :import do
  
  desc 'Import all Cheat Sheets in a Directory'
  task :from_dir => 'environment' do
    raise "No import directory specified. Please set ENV['FROM']" if ENV['FROM'].blank?
    dir = File.expand_path(ENV['FROM'])
    Dir.glob("#{dir}/**/*.yml").each do |path|
      s = Sheet.import File.new(path)
      puts "Imported #{s.title} from #{path}"
    end
  end
  
end
      