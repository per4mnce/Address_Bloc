#greeting.rb
def greeting
   ARGV.each { |arg| puts "#{ARGV.first} #{arg}!" unless ARGV.first == arg }
end
 
 greeting