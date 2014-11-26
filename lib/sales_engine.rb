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
include CSVHandler


class SalesEngine
  attr_reader :customers_repository,
              :invoices_repository,
              :invoice_items_repository,
              :items_repository,
              :merchants_repository,
              :transactions_repository

  def initialize
    @customer_data ||= CSVHandler.new("./data/customer.csv")
    @invoice_data ||= CSVHandler.new('./data/invoices.csv')
    @invoice_item_data ||= CSVHandler.new('./data/invoice_items.csv')
    @item_data ||= CSVHandler.new('./data/items.csv')
    @merchant_data ||= CSVHandler.new('./data/merchants.csv')
    @transaction_data ||= CSVHandler.new('./data/transactions.csv')

  end

  def startup
    @customers_repository = CustomersRepository.build_customers(@customer_data)
    @invoices_repository = InvoicesRepository.build_invoices(@invoice_data)
    @invoice_items_repository = InvoiceItemsRepository.build_invoice_items(@invoice_item_data)
    @transactions_repository = TransactionsRepository.build_transactions(@transaction_data)
    @merchants_repository = MerchantsRepository.build_merchants(@merchant_data)
    @items_repository = ItemsRepository.build_items(@item_data)
  end




end

engine = SalesEngine.new
engine.startup
