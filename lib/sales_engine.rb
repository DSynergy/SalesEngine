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
    @customer_data ||= CSVHandler.load_file('../data/customers.csv')
    @invoices_data ||= CSVHandler.load_file('../data/invoices.csv')
    @invoice_items_data ||= CSVHandler.load_file('../data/invoice_items.csv')
    @items_data ||= CSVHandler.load_file('../data/items.csv')
    @merchants_data ||= CSVHandler.load_file('../data/merchants.csv')
    @transactions_data ||= CSVHandler.load_file('../data/transactions.csv')
    CustomerRepository.build_customers(@customer_data)
  end

  def startup
    @customers_repository =  CustomerRepository.new(@customer_data)

    @invoices_repository = InvoicesRepository.new(@invoices_data )
    @invoice_items_repository = InvoiceItemsRepository.new(@invoice_items_data)
    @items_repository = ItemsRepository.new(@items_data)
    @merchants_repository = MerchantsRepository.new(@merchants_data)
    @transactions_repository = TransactionsRepository.new(@transactions_data)
  end




end

engine = SalesEngine.new
engine.startup
