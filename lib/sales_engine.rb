require 'csv'
require 'bigdecimal'
require 'time'
require_relative 'merchants'
require_relative 'merchants_repository'
require_relative 'customers'
require_relative 'customers_repository'
require_relative 'invoice_items'
require_relative 'invoice_items_repository'
require_relative 'invoices'
require_relative 'invoices_repository'
require_relative 'items'
require_relative 'items_repository'
require_relative 'metarepository'
require_relative 'transactions'
require_relative 'transactions_repository'
require_relative 'CSV_handler'


class SalesEngine
  attr_reader :customers_repository,
              :invoices_repository,
              :invoice_items_repository,
              :items_repository,
              :merchants_repository,
              :transactions_repository

  def initialize
    # startup(dir)
    @customers_repository ||= CSVHandler.customers_repository
    @invoices_repository ||= CSVHandler.invoices_repository
    @invoice_items_repository ||= CSVHandler.invoice_items_repository
    @items_repository ||= CSVHandler.items_repository
    @merchants_repository ||= CSVHandler.merchants_repository
    @transactions_repository ||= CSVHandler.transactions_repository
  end

  def startup

  end

engine = SalesEngine.new
engine.startup


end



# class SalesEngine
#   attr_reader :customer_repository, :invoice_repository, :invoice_item_repository, :item_repository, :merchant_repository, :transaction_repository
#   def initialize(dir="./data")
#     startup(dir)
#     @customer_repository ||= Database.customer_repository
#     @invoice_repository ||= Database.invoice_repository
#     @invoice_item_repository ||= Database.invoice_item_repository
#     @item_repository ||= Database.item_repository
#     @merchant_repository ||= Database.merchant_repository
#     @transaction_repository ||= Database.transaction_repository
#   end
#   def startup(dir)
#     Database.startup(dir)
#   end
# end
