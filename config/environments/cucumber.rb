eval File.read(File.join(File.dirname(__FILE__), 'test.rb'))

config.cache_classes = true # This must be true for Cucumber to operate correctly!

config.gem "cucumber",    :lib => false,        :version => ">=0.3.11" unless File.directory?(File.join(Rails.root, 'vendor/plugins/cucumber'))
config.gem "webrat",      :lib => false,        :version => ">=0.4.4" unless File.directory?(File.join(Rails.root, 'vendor/plugins/webrat'))