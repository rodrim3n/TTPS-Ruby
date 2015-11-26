class BillsController < ApplicationController
  before_action :set_bill, only: [:edit, :show, :update, :destroy]

  def index
    @bills = Bill.all
  end

  def show
  end

  def new
    @bill = Bill.new
  end

  def edit
  end

  def create
    @bill = Bill.new(bill_params)
    if @bill.save
      redirect_to @bill
    else
      render 'new'
    end
  end

  def update
    if @bill.update(bill_params)
      redirect_to @bill
    else
      render 'edit'
    end
  end

  def destroy
    @bill.destroy
    redirect_to bills_path
  end

  private
  def bill_params
    params.require(:bill).permit(:description, :total, :emission_date, :person_id, :client_id)
  end

  def set_bill
    @bill ||= Bill.find(params[:id])
  end
end
