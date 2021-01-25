require "pry"
require "time"
class Event
	attr_reader :start_date
	attr_accessor :duration, :title, :attendees

	def initialize(start_date, duration, title, attendees)
		@start_date = Time.parse(start_date)
		@duration = duration
		@title = title
		@attendees = attendees
	end

	def date_set(new_date)
		@start_date = Time.parse(new_date)
	end

	def postpone24
		@start_date += 24*60*60
	end

	def end_date
		return @start_date + (duration * 60)
	end

	def ispast
		return Time.now > @start_date
	end

	def isfuture
		return !ispast
	end

	def issoon
		return (Time.now - @start_date) < 1800 && (Time.now - @start_date) > -1800
	end

	def to_s
		puts "Titre : #{@title}"
		puts "Date de début : #{@start_date.strftime("%d/%m/%Y %X")}"
		puts "Durée : #{@duration} minutes"
		puts "Invités : #{@attendees.join(", ")}"
	end

	def save
		f = File.open("Events.txt", "a")
		f.write("#{{name: @title, date: @start_date.strftime("%d/%m/%Y %X"), duration: @duration, attendees: @attendees}}&")
		f.close
	end
end
puts 