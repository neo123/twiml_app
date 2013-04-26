class WelcomeController < ApplicationController
  def index

  end

  def voice
  	respond_to do |format|
      format.xml
    end
  end

  def voice_reply
    if params["client_id"]
      client_id = params["client_id"]
    else
      client_id = params["Digits"]
    end
    @customer = Customer.find_by_client_id(client_id)
  	@customer_services = @customer.customer_services.order("position asc") if !@customer.nil?
    respond_to do |format|
      format.xml
    end
  end

  def manage_service
    if params["try_again"] and params["try_again"] == "1"
      client_id = params["client_id"]
      service_id = params["service_id"]
      case params["Digits"]
      when "1"
        @success = true
      when "2"
        @success = false
      end
    else
      client_id = params["client_id"]
      service_id = params["Digits"]
      @success = true
    end
    @customer = Customer.find_by_client_id(client_id)
    ## TODO
    @customer_service = @customer.customer_services.find_by_service_id(service_id)
    respond_to do |format|
      format.xml
    end
  end

  def place_order
    ## TODO
    @customer = Customer.find_by_id(params["customer_id"])
    @customer_service = @customer.customer_services.find_by_service_id(params["service_id"])
    @customer_service.update_attributes(:quantity => params["Digits"])
    respond_to do |format|
      format.xml
    end
  end

  def handle_wrong_input
    case params["Digits"]
    when "1"
      @success = "true"
    else
      @success = "false"
    end
    respond_to do |format|
      format.xml
    end
  end

end
