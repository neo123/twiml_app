class Service < ActiveRecord::Base
  attr_accessible :name
  has_many :customer_services
  has_many :customers, :through => :customer_services
end
