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
  	@bill = Bill.find(params[:id])
  end

  def update
  	@bill = Bill.find(params[:id])
  	
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