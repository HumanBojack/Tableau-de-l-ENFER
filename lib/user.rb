require "pry"
class User
	@@all = []
	user = 0
	attr_accessor :email, :age
	
	def initialize(email, age)
		@email = email
		@age = age.to_i
		@@all << self
	end

	def self.find_by_email(email)
		@@all.each do |user|
			return user if user.email == email
		end
	end

	def self.everything
		print @@all
	end

end