require "time"
class CalendarDisplayer
tmp = File.open("Events.txt", "r")
tmp = tmp.read.split("&")

def compare(date)
	tmp.size.times do |n|
		if Time.parse(eval(tmp[n])[:date]).day == date
			return eval(tmp[n])[:name]
		end
	end
end

events_by_day = []

puts "-" * 71

7.times do |n|
	print "|#{n+1}        "
end

print "|"
puts
7.times do |jour|
temp = 0
print "|"
	tmp.size.times do |n|
		if jour + 1 == Time.parse(eval(tmp[n])[:date]).day
			print eval(tmp[n])[:name]
			print " " * (9 - eval(tmp[n])[:name].length)
			temp += 1
		end
	end
print "         " if temp == 0
end
print "|"



end
	

	# unless compare(n) == nil
	# 	print eval(tmp[n])[:name]

