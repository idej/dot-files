Pry.config.editor = "e"

# pry is polite
Pry.config.hooks.add_hook(:after_session, :say_bye) do
  puts "bye-bye"
end

# Prompt with ruby version
Pry.prompt = [proc { |obj, nest_level| "#{RUBY_VERSION} (#{obj}):#{nest_level} > " }, proc { |obj, nest_level| "#{RUBY_VERSION} (#{obj}):#{nest_level} * " }]

Pry.config.prompt = [proc{"> "}, proc{"| "}]

#pry aliases
Pry.commands.alias_command 'e', 'exit'
Pry.commands.alias_command 'q', 'exit-program'
Pry.commands.alias_command 'w', 'whereami'

if defined?(PryDebugger)
  Pry.commands.alias_command 'c', 'continue'
  Pry.commands.alias_command 's', 'step'
  Pry.commands.alias_command 'n', 'next'
  Pry.commands.alias_command 'f', 'finish'
end

# Toys methods
# Stealed from https://gist.github.com/807492
class Array
  def self.toy(n=10, &block)
    block_given? ? Array.new(n,&block) : Array.new(n) {|i| i+1}
  end
end

class Hash
  def self.toy(n=10)
    Hash[Array.toy(n).zip(Array.toy(n){|c| (96+(c+1)).chr})]
  end
end

Pry.hooks.add_hook :before_session, :rails do |output, target, pry|
  # show ActiveRecord SQL queries in the console
  if defined? ActiveRecord
    org_logger_active_record = ActiveRecord::Base.logger
    ActiveRecord::Base.logger = Logger.new STDOUT
  end
end

if Kernel.const_defined?(:Rails) && Rails.env
  require File.join(Rails.root,"config","environment")
  require 'rails/console/app'
  require 'rails/console/helpers'

  extend Rails::ConsoleMethods
end
## Benchmarking
# Inspired by <http://stackoverflow.com/questions/123494/whats-your-favourite-irb-trick/123834#123834>.
# def time(repetitions = 100, &block)
#   require 'benchmark'
#   Benchmark.measure{ repetitions.times(&block) }
# end

# loading rails configuration if it is running as a rails console
# load File.dirname(__FILE__) + '/.railsrc' if defined?(Rails) && Rails.env
