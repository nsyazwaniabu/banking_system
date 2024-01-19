require './bank'
require './transaction'

class User
	attr_accessor :name, :account, :balance, :track 

	def initialize(name=nil, balance=0)
		@name = name
		@account = account
		@balance = balance 
		@track = track 

	end

	def has_account?
		return false if @account.nil?
		return true
		
	end

	def create_account
		puts "Please enter your name: "
		@name = gets.chomp
		@account = Bank.add
		
		puts "#{name}, your new account is created!"
		puts "Your account number is #{account}"

	end

	def deposit
		puts "Please enter the amount you want to deposit: "
		deposit = gets.chomp.to_i
		@balance = @balance + deposit

		@track = "#{Time.now}: You deposited #{deposit}"
		Transaction.tracking_history(track)

		puts "Your new balance is RM#{balance}."
	end

	def cash_withdrawal
		puts "Please enter the amount to withdraw: "
		withdraw = gets.chomp.to_i

		if balance == 0
			puts "You don't have enough balance."
		elsif withdraw >= balance
			puts "You don't have enough balance."
		else
			@balance = @balance - withdraw

			@track = "#{Time.now}: You withdrew #{withdraw}"
			Transaction.tracking_history(track)
			puts "Your new balance is RM#{balance}."
		end

	end

	def view_balance
		puts "Your current balance is RM#{balance}"
		
	end

	def user_action(action)
		if action == 1
			deposit
		elsif action == 2
			view_balance
		elsif action == 3
			cash_withdrawal
		elsif action == 4
			Transaction.display_history
		else	
			puts "Invalid input."
		end
		
	end

end

puts "Welcome to NSA Bank."

puts "Do you have an account?"
puts "1 - Yes"
puts "2 - No"
has_acc = gets.chomp.to_i

if has_acc == 1
	puts "You already have an account."
	user1 = User.new
	@account = Bank.add
	puts "Your account: #{@account}"

elsif has_acc == 2
	puts "Please create a new account to proceed."
	puts "Creating an account..."
	user1 = User.new
	user1.create_account
else
	puts "Invalid input."
end

puts "Please select transaction."
puts "1 - Deposit, 2 - Balance inquiry, 3 - Cash withdrawal, 4 - History"
action = gets.chomp.to_i
user1.user_action(action)

loop do
	puts "Do you want to do another transaction?"
	puts "1 - Yes, 2 - No"
	continue = gets.chomp.to_i

	if continue == 1
		puts "1 - Deposit, 2 - Balance inquiry, 3 - Cash withdrawal, 4 - History"
		action = gets.chomp.to_i
		user1.user_action(action)
	else
		puts "Thank you for using NSA bank."
		break
	end 
end