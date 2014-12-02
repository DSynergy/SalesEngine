require_relative 'sales_engine'

class MetaRepository
  

# this stores all the methods that all the repositories needs

  def all
    # returns all instances
  end

  def random
    #returns a random instance
  end

  def find_by_atrribute(attribute)
    #returns a single instance of an attribute which matches the match parameter - case insensisitive
    # For instance, customer_repository.find_by_first_name("Mary") could find a Customer with the first name attribute "Mary" or "mary" but not "Mary Ellen"
    # Break apart into all different methods
    # attributes = customer: id,first_name,last_name,created_at,updated_at
    # invoice items = id,item_id,invoice_id,quantity,unit_price,created_at,updated_at
    # invoices = id,customer_id,merchant_id,status,created_at,updated_at
    # items = id,name,description,unit_price,merchant_id,created_at,updated_at
    # merchants = id,name,created_at,updated_at
    # transactions = id,invoice_id,credit_card_number,credit_card_expiration_date,result,created_at,updated_at

    # shared attributes: id,first_name,last_name,created_at,updated_at,item_id,invoice_id,quantity
    #   unit_price,customer_id,merchant_id,status,name,description,credit_card_number,
    #   credit_card_expiration_date,result
  end

  def find_all_by_attribute(attribute)
    # returns a collection of all matched by attribute. No match returns an empty array
  end


end
