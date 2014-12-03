require 'csv'
require 'bigdecimal'
# require 'time'
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
  attr_accessor :customers_repository,
                :invoices_repository,
                :invoice_items_repository,
                :items_repository,
                :merchants_repository,
                :transactions_repository

  attr_reader   :items, :merchants, :invoices, :transactions, :invoice_items, :customers

  alias_method :customer_repository, :customers_repository
  alias_method :invoice_repository, :invoices_repository
  alias_method :invoice_item_repository, :invoice_items_repository
  alias_method :item_repository, :items_repository
  alias_method :merchant_repository, :merchants_repository
  alias_method :transaction_repository, :transactions_repository

  def initialize(dir=File.join(__dir__, '..', 'data'))
    @customer_data     = CSVHandler.open_csv("#{dir}/customers.csv")
    @invoice_data      = CSVHandler.open_csv("#{dir}/invoices.csv")
    @invoice_item_data = CSVHandler.open_csv("#{dir}/invoice_items.csv")
    @item_data         = CSVHandler.open_csv("#{dir}/items.csv")
    @merchant_data     = CSVHandler.open_csv("#{dir}/merchants.csv")
    @transaction_data  = CSVHandler.open_csv("#{dir}/transactions.csv")
  end

  def startup
    @customers_repository     ||= CustomersRepository.build_customers(@customer_data,self)
    @invoices_repository      ||= InvoicesRepository.build_invoices(@invoice_data,self)
    @invoice_items_repository ||= InvoiceItemsRepository.build_invoice_items(@invoice_item_data,self)
    @transactions_repository  ||= TransactionsRepository.build_transactions(@transaction_data,self)
    @merchants_repository     ||= MerchantsRepository.build_merchants(@merchant_data,self)
    @items_repository         ||= ItemsRepository.build_items(@item_data,self)
  end

  def merchant_relationship_items(merchant)
    @items_repository.find_all_by_attribute(:merchant_id, merchant.id)
  end

  def merchant_relationship_invoices(merchant)
    @invoices_repository.find_all_by_attribute(:merchant_id, merchant.id)
  end

  def customer_relationships(customer)
    @invoices_repository.find_all_by_attribute(:id, customer.id)
  end

  def invoice_item_relationships_item(invoice_item)
    @items_repository.find_by_attribute(:id, invoice_item.id)
  end

  def invoice_item_relationships_invoice(invoice_item)
    @invoices_repository.find_by_attribute(:id, invoice_item.id)
  end

  def invoice_relationships_transactions(invoice)
    @transactions_repository.find_all_by_attribute(:invoice_id, invoice.id)
  end

  def invoice_relationships_invoice_item(invoice)
    @invoice_items_repository.find_all_by_attribute(:invoice_id, invoice.id)
  end

  def invoice_realtionships_item(invoice)
    @invoice_items_repository.find_all_by_attribute(:invoice_id, invoice.id)
  end #?

  def invoice_relationships_by_customer_id(invoice)
    @customers_repository.find_by_attribute(:id, customer.id)
  end

  def invoice_relationships_merchant_id(invoice)
    @merchants_repository.find_by_attribute(:id, merchant.id)
  end

  def item_relationships_by_invoice_items(item)
    @invoice_items_repository.find_all_by_attribute(:item_id, item.id)
  end

  def item_relationships_by_merchant(item)
    @merchants_repository.find_by_attribute(:id, merchant.id)
  end

  def transactions_relationships_invoice(transaction)
    @invoices_repository.find_by_attribute(:id, invoice.id)
  end


end


#
#
# engine = SalesEngine.new
# engine.startup
