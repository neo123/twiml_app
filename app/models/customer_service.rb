class CustomerService < ActiveRecord::Base
  attr_accessible :position, :customer_id, :quantity, :service_id
  belongs_to :customer
  belongs_to :service

  validates_presence_of :customer_id, :service_id
  validates_uniqueness_of :service_id, :scope => :customer_id
  before_create :set_per_order

  private
  def set_per_order
  	val = CustomerService.where(:customer_id => self.customer_id).maximum(:position)
  	self.position = val.nil? ? 1 : (val + 1)
  end
end