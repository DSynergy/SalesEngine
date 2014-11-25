require 'csv'
require 'bigdecimal'
require 'time'
require_relative 'merchant'
require_relative 'merchant_repository'
require_relative 'customer'
require_relative 'customer_repository'
require_relative 'invoice_items'
require_relative 'invoice_items_repository'
require_relative 'invoices'
require_relative 'invoices_repository'
require_relative 'items'
require_relative 'items_repository'
require_relative 'meta_repository'
require_relative 'transactions'
require_relative 'transactions_repository'


class SalesEngine
  attr_reader :customer_repository,
              :invoice_repository,
              :invoice_item_repository,
              :item_repository,
              :merchant_repository,
              :transaction_repository

  def initialize
    # startup(dir)
    @customer_repository ||= CSVHandler.customer_repository
    @invoice_repository ||= CSVHandler.invoice_repository
    @invoice_item_repository ||= CSVHandler.invoice_item_repository
    @item_repository ||= CSVHandler.item_repository
    @merchant_repository ||= CSVHandler.merchant_repository
    @transaction_repository ||= CSVHandler.transaction_repository
  end

  def startup

  end

engine = SalesEngine.new
engine.startup


end


#
#
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
