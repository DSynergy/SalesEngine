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
  attr_accessor :customers_repository,
                :invoices_repository,
                :invoice_items_repository,
                :items_repository,
                :merchants_repository,
                :transactions_repository

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


end


#
#
# engine = SalesEngine.new
# engine.startup
