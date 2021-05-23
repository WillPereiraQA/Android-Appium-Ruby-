require 'pry'
require 'appium_lib'
require_relative File.expand_path('../android/screens/base_screen.rb', __dir__)

class AppiumWorld
end
if ENV['HUB'].nil?
  caps = Appium.load_appium_txt file: File.expand_path("../caps/#{ENV['PLATFORM']}.txt", __FILE__), verbose: true
else
  caps = Appium.load_appium_txt file: File.expand_path("../caps/#{ENV['PLATFORM']}_hub.txt", __FILE__), verbose: true
  unless caps[:caps][:derivedDataPath].nil?
    new_cap = { derivedDataPath: Dir.pwd + '/' + caps[:caps][:derivedDataPath] }
    caps[:caps].merge!(new_cap)
  end
end
Appium::Driver.new(caps, true)

Appium.promote_appium_methods Object

World do
  AppiumWorld.new
end
