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

  def initialize
    @customer_data     = CSVHandler.open_csv("../data/customers.csv")
    @invoice_data      = CSVHandler.open_csv('../data/invoices.csv')
    @invoice_item_data = CSVHandler.open_csv('../data/invoice_items.csv')
    @item_data         = CSVHandler.open_csv('../data/items.csv')
    @merchant_data     = CSVHandler.open_csv('../data/merchants.csv')
    @transaction_data  = CSVHandler.open_csv('../data/transactions.csv')

  end

  def startup

    @customers_repository     = CustomersRepository.build_customers(@customer_data)
    @invoices_repository      = InvoicesRepository.build_invoices(@invoice_data)
    @invoice_items_repository = InvoiceItemsRepository.build_invoice_items(@invoice_item_data)
    @transactions_repository  = TransactionsRepository.build_transactions(@transaction_data)
    @merchants_repository     = MerchantsRepository.build_merchants(@merchant_data)
    @items_repository         = ItemsRepository.build_items(@item_data)
  end




end

engine = SalesEngine.new
engine.startup

# ~> Errno::ENOENT
# ~> No such file or directory @ rb_sysopen - ../data/customers.csv
# ~>
# ~> /Users/DBomb/.rvm/rubies/ruby-2.1.3/lib/ruby/2.1.0/csv.rb:1256:in `initialize'
# ~> /Users/DBomb/.rvm/rubies/ruby-2.1.3/lib/ruby/2.1.0/csv.rb:1256:in `open'
# ~> /Users/DBomb/.rvm/rubies/ruby-2.1.3/lib/ruby/2.1.0/csv.rb:1256:in `open'
# ~> /Users/DBomb/turing/Module 1 - Ruby and TDD/Sales_Engine/sales_engine/lib/CSV_handler.rb:13:in `open_csv'
# ~> /Users/DBomb/turing/Module 1 - Ruby and TDD/Sales_Engine/sales_engine/lib/sales_engine.rb:29:in `initialize'
# ~> /Users/DBomb/turing/Module 1 - Ruby and TDD/Sales_Engine/sales_engine/lib/sales_engine.rb:52:in `new'
# ~> /Users/DBomb/turing/Module 1 - Ruby and TDD/Sales_Engine/sales_engine/lib/sales_engine.rb:52:in `<main>'
