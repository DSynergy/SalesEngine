require 'csv'
require 'bigdecimal'
require 'time'
require_relative 'merchant'
require_relative 'merchants_repository'
require_relative 'customer'
require_relative 'customers_repository'
require_relative 'invoice_item'
require_relative 'invoice_items_repository'
require_relative 'invoice'
require_relative 'invoices_repository'
require_relative 'item'
require_relative 'items_repository'
require_relative 'metarepository'
require_relative 'transaction'
require_relative 'transactions_repository'
require_relative 'CSV_handler'


class SalesEngine
  attr_reader :customers_repository,
              :invoices_repository,
              :invoice_items_repository,
              :items_repository,
              :merchants_repository,
              :transactions_repository

  def initialize(dir=File.join(__dir__, '..', 'data'))
    @customer_data     = CSVHandler.open_csv("#{dir}/customers.csv")
    @invoice_data      = CSVHandler.open_csv("#{dir}/invoices.csv")
    @invoice_item_data = CSVHandler.open_csv("#{dir}/invoice_items.csv")
    @item_data         = CSVHandler.open_csv("#{dir}/items.csv")
    @merchant_data     = CSVHandler.open_csv("#{dir}/merchants.csv")
    @transaction_data  = CSVHandler.open_csv("#{dir}/transactions.csv")
    @search_results = []
    @repository = repository
  end

  def startup
    @customers_repository     = CustomersRepository.build_customers(@customer_data,self)
    @invoices_repository      = InvoicesRepository.build_invoices(@invoice_data,self)
    @invoice_items_repository = InvoiceItemsRepository.build_invoice_items(@invoice_item_data,self)
    @transactions_repository  = TransactionsRepository.build_transactions(@transaction_data,self)
    @merchants_repository     = MerchantsRepository.build_merchants(@merchant_data,self)
    @items_repository         = ItemsRepository.build_items(@item_data,self)
  end

  def merchant_relationships
    @merchants_repository.all.each do |merchant|
      merchant.items    = @items_repository.find_all_by_attribute(merchant_id, id)
      merchant.invoices = @invoices_repository.find_all_by_attribute(merchant_id, id)
    end
  end

  def customer_relationships
    @customers_repository.all.each do |invoice|
      customer.invoices = @invoices_repository.find_by_attribute(invoice_id, id)
    end
  end

  def invoice_item_relationships
    @invoice_items_repository.all.each do |item|
      invoice_item.item       = @items_repository.find_by_attribute(item_id, id)
    end
    @invoice_items_repository.all.each do |invoice|
      invoice_item.invoice    = @invoices_repository.find_by_attribute(invoice_id, id)
    end
  end


  def invoice_relationships
    @invoices_repository.all.each do |transaction|
      invoice.transactions    = @transactions_repository.find_all_by_attribute(transaction_id, id)
    end
    @invoices_repository.all.each do |invoice_item|
      invoice.invoice_items       = @invoice_items_repository.find_all_by_attribute(invoice_item.id)
    end
    @invoices_repository.all.each do |item|
      invoice.items           = @invoice_items_repository.find_all_by_attribute(item_id, id)
    end
    @invoices_repository.all.each do |customer|
      invoice.customer        = @customers_repository.find_by_attribute(customer_id, id)
    end
    @invoices_repository.all.each do |merchant|
      invoice.merchant        = @merchants_repository.find_by_attribute(merchant_id, id)
    end
  end

  def item_relationships
    @items_repository.all.each do |invoice_items|
      item.invoice_items    = @invoice_items_repository.find_all_by_attribute(invoice_items_id, id)
    end
    @items_repository.all.each do |merchant|
      item.merchant     = @merchants_repository.find_by_attribute(merchant_id, id)
    end
  end

  def transactions_relationships
    @transactions_repository.all.each do |invoice|
      transaction.inovice    = @invoices_repository.find_by_attribute(invoice_id, id)
    end
  end

  def all
    @search_results << @repository # returns all instances of the repo
  end

  def random
    @search_results << @repository.sample
  end

  def find_by_attribute(attribute, criteria)
    @search_results << @repository.detect {|x| x[attribute.to_sym] == criteria}

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

  def find_all_by_attribute(attribute, criteria)
    @search_results << @repository.select {|x| x[attribute.to_sym] == criteria}
    # returns a collection of all matched by attribute. No match returns an empty array
  end


end


end

engine = SalesEngine.new
engine.startup
