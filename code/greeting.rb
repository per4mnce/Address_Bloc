=begin
Assignment 18 - Address Bloc: Ruby App
Write a program named greeting.rb that takes multiple command-line arguments. 
The first argument should be the greeting to be used. The rest of the arguments should be the names 
of people to greet. The program should print out a greeting for each person. For example:

$ ruby greeting.rb Hey Sterling Cheryl Lana ==> returns:
Hey Sterling
Hey Cheryl
Hey Lana
=end

def greeting
   ARGV.each { |arg| puts "#{ARGV.first} #{arg}!" unless ARGV.first == arg }
end
 
greeting