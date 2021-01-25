require_relative "event.rb"
class EventCreator
	puts "Quel est le nom de ton événement ?"
	event_name = gets.chomp
	puts "Quand aura t'il lieu ?"
	time = gets.chomp
	puts "Combien de temps durera t'il (minutes) ?"
	duration = gets.chomp
	puts "Liste des participants (emails séparés d'une virgule)"
	emails = gets.chomp.split(", ")
	current_event = Event.new(time, duration, event_name, emails)
	current_event.save
end
