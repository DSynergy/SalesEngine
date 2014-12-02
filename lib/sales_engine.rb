require 'csv'                                # => true
require 'bigdecimal'                         # => true
require 'time'                               # => true
require_relative 'merchant'                  # => true
require_relative 'merchants_repository'      # => true
require_relative 'customer'                  # => true
require_relative 'customers_repository'      # => true
require_relative 'invoice_item'              # => true
require_relative 'invoice_items_repository'  # => true
require_relative 'invoice'                   # => true
require_relative 'invoices_repository'       # => true
require_relative 'item'                      # => true
require_relative 'items_repository'          # => true
require_relative 'metarepository'            # => true
require_relative 'transaction'               # => true
require_relative 'transactions_repository'   # => true
require_relative 'CSV_handler'               # => true


class SalesEngine
  attr_reader :customers_repository,      # => :customers_repository
              :invoices_repository,       # => :invoices_repository
              :invoice_items_repository,  # => :invoice_items_repository
              :items_repository,           # => :itemsrepository
              :merchants_repository,      # => :merchants_repository
              :transactions_repository    # => nil

  def initialize(dir=File.join(__dir__, '..', 'data'))
    @customer_data     = CSVHandler.open_csv("#{dir}/customers.csv")
    @invoice_data      = CSVHandler.open_csv("#{dir}/invoices.csv")
    @invoice_item_data = CSVHandler.open_csv("#{dir}/invoice_items.csv")
    @item_data         = CSVHandler.open_csv("#{dir}/items.csv")
    @merchant_data     = CSVHandler.open_csv("#{dir}/merchants.csv")
    @transaction_data  = CSVHandler.open_csv("#{dir}/transactions.csv")
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
    merchants_repository.all.each do |merchant|
      merchant.items    = items_repository.find_all_by_attribute(merchant.id)
      merchant.invoices = invoices_repository.find_all_by_attribute(merchant.id)
    end
  end

  def customer_relationships
    customers_repository.all.each do |customer|
      customer.invoices = customer_repository.find_all_by_attribute(invoice.id)
    end
  end

  def invoice_item_relationships
    invoice_items_repository.all.each do |item|
      invoice_item.item       = invoice_items_repository.find_by_attribute(item.id)
    end
    invoice_items_repository.all.each do |invoice|
      invoice_item.invoice    = invoice_items_repository.find_by_attribute(invoice.id)
    end
  end


  def invoice_relationships
    merchant_repository.all.each do |merchant|
      merchant.items    = items_repository.find_all_by_attribute(merchant.id)
      merchant.invoices = invoices_repository.find_all_by_attribute(merchant.id)
    end
  end

  def item_relationships
    merchant_repository.all.each do |merchant|
      merchant.items    = items_repository.find_all_by_attribute(merchant.id)
      merchant.invoices = invoices_repository.find_all_by_attribute(merchant.id)
    end
  end

  def transactions_relationships
    merchant_repository.all.each do |merchant|
      merchant.items    = items_repository.find_all_by_attribute(merchant.id)
      merchant.invoices = invoices_repository.find_all_by_attribute(merchant.id)
    end
  end

end

engine = SalesEngine.new
engine.startup
