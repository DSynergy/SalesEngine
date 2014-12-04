require_relative 'customers_repository'

class Customer

attr_reader :engine, :id, :first_name, :last_name, :created_at, :updated_at

  def initialize(data,engine)
    @id = data[:id].to_i
    @first_name = data[:first_name]
    @last_name = data[:last_name]
    @created_at = data[:created_at]
    @updated_at = data[:updated_at]
    @engine = engine
  end

  def invoices
    @engine.customer_relationships_invoices(self)
  end

end
