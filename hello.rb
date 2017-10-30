require 'optparse'

options = {}

OptionParser.new do |parser|

  parser.banner = "Usage: hello.rb [options]"
  parser.on("-h", "--help HELP", "Show this message") do ||
    puts parser
  end
  # Whenever we see -n or --name, with an
  # argument, save the argument.
  parser.on('-n', '--name NAME', 'The name of the person to greet') do |v|
  options[:name] = v
  end
  # Note the `Integer` arg. That tells the parser to cast the value to an int.
  # I could have used `Float`, `Date`, or a number of other types.
  parser.on("-c", "--count COUNT", Integer, "Repeat the message COUNT times") do |v|
    options[:count] = v
  end

end.parse!

if options[:name]
  options.fetch(:count, 1).times do
    puts "Hello #{ options[:name]}!"
  end
end


