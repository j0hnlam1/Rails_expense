class BillsController < ApplicationController
  def index
    #calling the private method
    render_bills
  end
  def create
    Bill.create(bill_params)
    #calling the private method
    render_bills
  end

  def destroy
  	Bill.find(params[:id]).destroy
  	render_bills
  end

  def edit
  	@bill = Bill.find_by_id(params[:id])
    puts "****"
    puts @bill.inspect
  end

  def update
  	@bill = Bill.find(params[:id])
    if @bill.update(bill_params)
          flash[:success] = "bill successfully updated"
          redirect_to "/show"
      else
          flash[:errors] = @bill.errors.full_messages
      end
  	
  end

  private
    #private methods that queries all players in json format
    def render_bills
      render :json => Bill.all
    end
    def bill_params
      params.require(:bill).permit(:name, :price, :date, :category, :description)
    end
end