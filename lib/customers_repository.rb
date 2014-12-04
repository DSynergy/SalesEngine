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

  def customers
    @entries
  end

  def find_all_by_last_name(name)
    find_all_by_attribute(:last_name, name)
  end

  def find_by_last_name(name)
    find_by_attribute(:last_name, name)
  end

  def find_all_by_first_name(name)
    find_all_by_attribute(:first_name, name)
  end

  def find_by_first_name(name)
    find_by_attribute(:first_name, name)
  end

  def find_by_id(id)
    find_by_attribute(:id, id)
  end
  
end
