class Customer < ActiveRecord::Base
  attr_accessible :client_id, :name
  has_many :customer_services
  has_many :services, :through => :customer_services
 # accepts_nested_attributes_for :customer_services

 validates_uniqueness_of :name, :client_id
 validates_presence_of :name, :client_id
end
