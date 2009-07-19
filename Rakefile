# Add your own tasks in files placed in lib/tasks ending in .rake,
# for example lib/tasks/capistrano.rake, and they will automatically be available to Rake.

require(File.join(File.dirname(__FILE__), 'config', 'boot'))

require 'rake'
require 'rake/testtask'
require 'rake/rdoctask'

require 'tasks/rails'

namespace :import do
  
  desc 'Import all cheat sheets in a Directory'
  task :from_dir => 'environment' do
    raise "No import directory specified. Please set ENV['FROM']" if ENV['FROM'].blank?
    dir = File.expand_path(ENV['FROM'])
    Sheet::Importer::Directory.new(dir).import_all
  end
  
  desc 'Import all cheat sheets from http://cheats.errtheblog.com'
  task :from_www => 'environment' do
    Sheet::Importer::ErrTheBlog.new.import_all
  end
  
end
      