require_relative 'test_helper'
require_relative '../lib/sales_engine'

class IntegrationTest < Minitest::Test

  def setup(dir=File.join(__dir__, '..', 'data'))
    @customer_data     = CSVHandler.open_csv("#{dir}/fixtures/customers.csv")
    @invoice_data      = CSVHandler.open_csv("#{dir}/fixtures/invoices.csv")
    @invoice_item_data = CSVHandler.open_csv("#{dir}/fixtures/invoice_items.csv")
    @item_data         = CSVHandler.open_csv("#{dir}/fixtures/items.csv")
    @merchant_data     = CSVHandler.open_csv("#{dir}/fixtures/merchants.csv")
    @transaction_data  = CSVHandler.open_csv("#{dir}/fixtures/transactions.csv")
    @customers_repository     = CustomersRepository.build_customers(@customer_data,self)
    @invoices_repository      = InvoicesRepository.build_invoices(@invoice_data,self)
    @invoice_items_repository = InvoiceItemsRepository.build_invoice_items(@invoice_item_data,self)
    @transactions_repository  = TransactionsRepository.build_transactions(@transaction_data,self)
    @merchants_repository     = MerchantsRepository.build_merchants(@merchant_data,self)
    @items_repository         = ItemsRepository.build_items(@item_data,self)
    @engine                   = SalesEngine.new(File.join(__dir__, '..', 'data', 'fixtures'))
  end

  def test_a_sales_engine_can_be_instantiated
    assert @engine.kind_of?(SalesEngine)
  end

  def test_sales_engine_can_talk_to_items_repository
    @engine.startup
    assert @engine.items_repository
  end

  def test_sales_engine_can_talk_to_merchants_repository
    @engine.startup
    assert @engine.items_repository
  end

  def test_sales_engine_can_talk_to_transactions_repository
    @engine.startup
    assert @engine.transactions_repository
  end

  def test_sales_engine_can_talk_to_customers_repository
    @engine.startup
    assert @engine.customers_repository
  end

  def test_sales_engine_can_talk_to_invoices_repository
    @engine.startup
    assert @engine.invoices_repository
  end

  def test_sales_engine_can_talk_to_invoice_items_repository
    @engine.startup
    assert @engine.invoice_items_repository
  end

end
