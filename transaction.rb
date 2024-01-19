class Transaction
	@@history = []

	def self.tracking_history(track)
		@@history << track
	end

	def self.display_history
		puts @@history 
		
	end
end