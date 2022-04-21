name1 = 'larry'
health1 = 60

name2 = 'curly'
health2 = 125

name3 = 'moe'
health3 = 100

name4 = 'shemp'
health4 = 90

puts "#{name1.capitalize}'s health is #{health1}"
puts "#{name2.upcase}'s health is #{health2}"
puts "#{name3.capitalize}'s health is #{health3}".center(50, '*')
puts "#{name4.capitalize.ljust(30, '.')}#{health4} health"

puts "Players:\n\t#{name1}\n\t#{name2}\n\t#{name3}"
