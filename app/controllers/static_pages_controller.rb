class StaticPagesController < ApplicationController
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
