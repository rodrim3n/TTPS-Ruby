class ClientsController < ApplicationController
  before_action :set_client, only: [:edit, :show, :update, :destroy]

  def index
    @clients = Client.all
  end

  def new
    @client = Client.new
    @client.contacts.build
  end

  def show
    @bills_by_year = @client.bills.total_per_year

    @bills_per_month = @client.bills.emitted_per_month(Date.current.year.to_s)

    @most_sold = @client.bills.most_sold.first(5).collect  do |person_total|
      [ Person.find(person_total[0]).name, person_total[1] ]
    end
  end

  def edit
  end

  def create
    @client = Client.new(client_params)
    if @client.save
      redirect_to @client
    else
      render 'new'
    end
  end

  def update
    if @client.update(client_params)
      redirect_to @client
    else
      render 'edit'
    end
  end

  def destroy
    @client.destroy
    redirect_to clients_path
  end

  private
  def client_params
    params.require(:client).permit(:name, :surname, :gender, :dni, :birthdate, :cui,
                                   contacts_attributes: [:id, :source, :value, :_destroy])
  end

  def set_client
    @client ||= Client.find(params[:id])
  end
end
