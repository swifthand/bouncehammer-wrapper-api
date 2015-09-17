require 'irb/completion'
IRB.conf[:AUTO_INDENT] = true

require 'bundler'
Bundler.require(:default)

# Let's get AWESOME in here!
require 'awesome_print'
AwesomePrint.irb! if defined? AwesomePrint

class Object
  def interesting_methods
    case self.class
    when Class
      self.public_methods.sort - Object.public_methods
    when Module
      self.public_methods.sort - Module.public_methods
    else
      self.public_methods.sort - Object.new.public_methods
    end
  end
end
