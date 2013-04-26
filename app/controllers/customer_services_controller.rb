class CustomerServicesController < ApplicationController
  # GET /customer_services
  # GET /customer_services.json
  before_filter :find_common_data, :only => [:new, :create, :edit, :update]

  def index
    @customer_services = CustomerService.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @customer_services }
    end
  end

  # GET /customer_services/1
  # GET /customer_services/1.json
  def show
    @customer_service = CustomerService.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @customer_service }
    end
  end

  # GET /customer_services/new
  # GET /customer_services/new.json
  def new
    @customer_service = CustomerService.new
    
    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @customer_service }
    end
  end

  # GET /customer_services/1/edit
  def edit
    @customer_service = CustomerService.find(params[:id])
  end

  # POST /customer_services
  # POST /customer_services.json
  def create
    @customer_service = CustomerService.new(params[:customer_service])

    respond_to do |format|
      if @customer_service.save
        format.html { redirect_to @customer_service, notice: 'Customer service was successfully created.' }
        format.json { render json: @customer_service, status: :created, location: @customer_service }
      else
        format.html { render action: "new" }
        format.json { render json: @customer_service.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /customer_services/1
  # PUT /customer_services/1.json
  def update
    @customer_service = CustomerService.find(params[:id])

    respond_to do |format|
      if @customer_service.update_attributes(params[:customer_service])
        format.html { redirect_to @customer_service, notice: 'Customer service was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @customer_service.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /customer_services/1
  # DELETE /customer_services/1.json
  def destroy
    @customer_service = CustomerService.find(params[:id])
    @customer_service.destroy

    respond_to do |format|
      format.html { redirect_to customer_services_url }
      format.json { head :no_content }
    end
  end


  private
  def find_common_data
    @customers = Customer.all
    @services = Service.all
  end
end
