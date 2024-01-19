#require './user'

class Bank
	@@list_account = []

	def self.add
		account = rand(100900..100999)

		if @@list_account.include?(account)
			puts "This account is already registered."
		else
			@@list_account << account
		end
		account
	end

end