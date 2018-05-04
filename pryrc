Pry.config.editor = "nvim"

# pry is polite
Pry.config.hooks.add_hook(:after_session, :say_bye) do
  puts "bye-bye"
end

# Prompt with ruby version
Pry.config.prompt = [
  proc{ |target_self, nest_level| "[#{nest_level}]> "},
  proc{ |target_self, nest_level| "[#{nest_level}]| "}
]

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

# Stealed from https://gist.github.com/807492
class Array
  def self.toy(n = 10, &block)
    block_given? ? Array.new(n, &block) : Array.new(n) { |_| _ + 1 }
  end
end

class Hash
  def self.toy(n = 10)
    Hash[Array.toy(n).zip(Array.toy(n) { |c| (96 + (c + 1)).chr })]
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
  require File.join(Rails.root, "config", "environment")
  require 'rails/console/app'
  require 'rails/console/helpers'
  extend Rails::ConsoleMethods
end

begin
  require 'rubygems'

  gem = 'awesome_print'
  if defined?(::Bundler)
    spec_path = Dir.glob("#{Gem.dir}/specifications/#{gem}-*.gemspec").last
    return if spec_path.nil?

    spec = Gem::Specification.load spec_path
    spec.activate
  end

  require gem
  Pry.config.print = proc {|output, value| Pry::Helpers::BaseHelpers.stagger_output("=> #{value.ai(indent: 2)}", output)}
rescue Exception => err
  warn "Couldn't load #{gem}: #{err}"
end
