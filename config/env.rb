require "bundler"
Bundler.require(:default, (ENV['RACK_ENV'] || 'production'))
require "active_support"
require "active_support/core_ext"

module BounceHammerAPI
  def self.root
    @root ||= File.expand_path('../../',  __FILE__)
  end
end

require File.join(BounceHammerAPI.root, 'config/settings')
require File.join(BounceHammerAPI.root, 'app')
Dir[File.join(BounceHammerAPI.root, 'app/*.rb')].reverse_each { |path| require path }
