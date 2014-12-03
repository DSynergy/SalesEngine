require_relative 'test_helper'
require '../lib/sales_engine'
require 'bigdecimal'

class RelationshipTest < Minitest::Test

  Merchant

  def test_returns_item_instances_associated_with_merchant_for_product
    merchant_relationships.
  end

  def test_invoices_returns_invoice_instances_associated_with_merchant

  end

  23) SalesEngine merchants Relationships #items has the correct number of them
  Failure/Error: expect(merchant.items.size).to eq 33
  NoMethodError:
  undefined method `all' for nil:NilClass
  # /Users/edmac/Turing/sales_engine/lib/merchant.rb:21:in `merchant_relationships'
  # /Users/edmac/Turing/sales_engine/lib/merchant.rb:16:in `items'
  # ./spec/merchant_spec.rb:39:in `block (4 levels) in <top (required)>'

  24) SalesEngine merchants Relationships #items includes a known item
  Failure/Error: expect(merchant.items.map &:name).to include 'Item Consequatur Odit'
  NoMethodError:
  undefined method `all' for nil:NilClass
  # /Users/edmac/Turing/sales_engine/lib/merchant.rb:21:in `merchant_relationships'
  # /Users/edmac/Turing/sales_engine/lib/merchant.rb:16:in `items'
  # ./spec/merchant_spec.rb:43:in `block (4 levels) in <top (required)>'

  25) SalesEngine merchants Relationships #invoices has the correct number of them
  Failure/Error: expect(merchant.invoices.size).to eq 43
  NoMethodError:
  undefined method `invoices' for #<Merchant:0x007fa82e193a88>
  # ./spec/merchant_spec.rb:49:in `block (4 levels) in <top (required)>'

  26) SalesEngine merchants Relationships #invoices has a shipped invoice for a specific customer
  Failure/Error: invoice = merchant.invoices.find {|i| i.customer.last_name == 'Block' }
  NoMethodError:
  undefined method `invoices' for #<Merchant:0x007fa82e193a88>
  # ./spec/merchant_spec.rb:53:in `block (4 levels) in <top (required)>'

  Invoice

  def test_transactions_returns_collection_of_transaction_instances

  end

  def test_invoice_items_return_associated_invoice_item_instances

  end

  def test_items_returns_collection_of_items_by_way_of_invoice_item

  end

  def test_customer_returns_instance_of_customer_class_associated_with_invoice

  end

  def test_merchant_returns_merchant_class_instance_with_invoices

  end

  InvoiceItem

  def test_invoice_returns_invoice_instances_with_invoice_items

  end

  def test_item_returns_instance_of_item_with_invoice_item

  end

  Item

  def test_invoice_items_return_collection_of_invoice_items_associated_with_item

  end

  def test_return_instances_of_merchant_associated_with_item

  end

  Transaction

  def test_returns_instance_of_invoice_associated_with_transaction

  end

  Customer

  def test_returns_collection_of_invoices_associated_with_customer

  end

end
