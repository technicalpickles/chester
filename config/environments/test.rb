config.cache_classes = true

# Log error messages when you accidentally call methods on nil.
config.whiny_nils = true

config.action_controller.consider_all_requests_local = true
config.action_controller.perform_caching             = false
config.action_view.cache_template_loading            = true

config.action_controller.allow_forgery_protection    = false

config.action_mailer.delivery_method = :test

config.gem "thoughtbot-shoulda", :lib => "shoulda"
config.gem "rr"
config.gem "rspec",       :lib => false,        :version => ">=1.2.6" unless File.directory?(File.join(Rails.root, 'vendor/plugins/rspec'))
config.gem "rspec-rails", :lib => 'spec/rails', :version => ">=1.2.6" unless File.directory?(File.join(Rails.root, 'vendor/plugins/rspec-rails'))
config.gem "thoughtbot-factory_girl", :lib => "factory_girl"
config.gem 'chrisk-fakeweb', :lib => 'fake_web', :version => '1.2.1'