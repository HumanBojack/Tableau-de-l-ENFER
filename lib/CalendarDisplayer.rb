require "time"
class CalendarDisplayer
@tmp = File.open("Events.txt", "r")
@tmp = @tmp.read.split("&")

def self.compare(date)
	@tmp.size.times do |n|
		if Time.parse(eval(@tmp[n])[:date]).day == date
			return eval(@tmp[n])[:name]
		end
	end
	return 0
end

puts "-" * 71

7.times do |n|
	print "|#{n+1}        "
end

print "|"
puts

7.times do |jour|
print "|"
		unless compare(jour) == 0
			print compare(jour)
			print " " * (9 - compare(jour).size)
		else 
			print "         "
		end
end
print "|"

end