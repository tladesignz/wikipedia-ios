source "https://rubygems.org"

group :ci do
  gem 'fastlane'
  gem 'xcode-install'
end

plugins_path = File.join(File.dirname(__FILE__), 'fastlane', 'Pluginfile')
eval_gemfile(plugins_path) if File.exist?(plugins_path)
