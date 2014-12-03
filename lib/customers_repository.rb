require_relative 'MetaRepository'
require_relative 'sales_engine'

class CustomersRepository < MetaRepository
  attr_reader :engine, :entries

  def inspect
    "#<#{self.class} #{@customers.size} rows>"
  end

  def self.build_customers(data,engine)
    customer_objects = data.map do |row|
      Customer.new(row,engine)
    end
    self.new(customer_objects,engine)
  end

  def find_all_by_last_name(name)
    find_all_by_attribute(:last_name, name)
  end

  def find_by_last_name(name)
    find_by_attribute(:last_name, name)
  end

  def find_by_first_name(name)
    find_by_attribute(:first_name, name)
  end

  def find_all_by_first_name(name)
    find_all_by_attribute(:first_name, name)
  end

  def find_by_id(id)
    find_by_attribute(:id, id)
  end

  def customers
    @entries
  end

  def invoices
    @engine.customer_relationships # returns a collection of Invoice instances associated with this object.end
  end

  # Customer Extension
  #
  # most_items returns the Customer who has purchased the most items by quantity
  # most_revenue returns the Customer who has generated the most total revenue
  #



end



# path = File.join(__dir__, filename)
