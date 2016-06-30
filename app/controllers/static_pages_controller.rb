class StaticPagesController < ApplicationController

  require 'twilio-ruby' 
  require 'rufus-scheduler'

  def twilio
puts "============1"
    accountSID = "AC598b3c707010b9e6048312f616e1c458" # Your Account SID from www.twilio.com/console
    authToken = "7f85a196fff3203a770904d1ddd60d73"   # Your Auth Token from www.twilio.com/console

    @client = Twilio::REST::Client.new accountSID, authToken
puts "============2"
    from = '+18312784223'
puts "============3"
    friends = {'+14084580638' => "John Lam"}
puts "============4"
    friends.each do |key, value|
      message = @client.account.messages.create(
          :from => from,
          :to => key,
          :body => "Wells Checking account due in 3 days" #Account
        )
      puts "Sent message"
    end
  end

  def index

 

  m = Bill.where(category:"Misc").select(:price)
  		@misc = 0
  		m.each do  |z|
  			@misc += z.price
  		end
  		@misc = @misc.to_f

  h = @home_expenses  = Bill.where(category:"Home Expenses").select(:price)
    	@h_e = 0
  		h.each do  |z|
  			@h_e += z.price
  		end
  		@h_e = @h_e.to_f

  e = @entertainment  = Bill.where(category:"Entertainment").select(:price)
    	@e = 0
  		e.each do  |z|
  			@e += z.price
  		end
  		@e = @e.to_f		
  end
end
