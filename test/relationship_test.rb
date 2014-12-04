require_relative 'test_helper'
require '../lib/sales_engine'
require 'bigdecimal'

class RelationshipTest < Minitest::Test

  def setup
    @engine = SalesEngine.new
  end

  # Merchant

  def test_returns_item_instances_associated_with_merchant_for_product
    @engine.merchant_relationships_items(merchant.id)
    assert_equal 76, merchant_id
    # assert_equal "Kirlin, Jakubowski and Smitham", merchant.name

  end

  def test_invoices_returns_invoice_instances_associated_with_merchant
    skip
    engine.merchant_relationship_invoices.find_by_attribute(:id)
    assert_equal 593, customer.invoices.id
  end

  # Invoice

  def test_transactions_returns_collection_of_transaction_instances
    skip
    engine.invoice_repository.find_by_id 1002
    assert_equal 1, invoice.transactions.size # count
  end

  def test_invoice_items_return_associated_invoice_item_instances
    skip
    engine.invoice_item_relationships_invoice.find_by_id 1326
    assert_equal 'Item Accusamus Officia', items.name
  end

  def test_items_returns_collection_of_items_by_way_of_invoice_item
    skip
    engine.invoice_repository.find_by_id 1002
    invoice_item_names = invoice.invoice_items.map { |ii| ii.item.name }
    assert_equal 'Item Accusamus Officia', invoice_item_names
  end

  def test_customer_returns_instance_of_customer_class_associated_with_invoice
    skip
    engine.invoice_repository.find_by_id 1002
      assert_equal "Eric", invoice.customer.first_name        # His ID is 196 within customer.csv
      assert_equal "Bergnaum", invoice.customer.last_name
  end

  def test_merchant_returns_merchant_class_instance_with_invoices
    skip
    assert_equal 3, invoice.invoice_items.size
  end

  # InvoiceItem

  def test_invoice_returns_invoice_instances_with_invoice_items
    skip
    engine.invoice_item_relationships_item.find_by_id 16934
    assert_equal "Item Cupiditate Magni", invoice_item.item.name
  end

  def test_item_returns_instance_of_item_with_invoice_item
    skip
    engine.invoice_item_relationships_invoice.find_by_id 16934
    assert_equal "Item Cupiditate Magni", invoice_item.item.name
  end

  # Item

  def test_invoice_items_return_invoice_items_associated_with_item
    skip
    engine.item_repository.find_by_name "Item Saepe Ipsum"
    assert_equal 449 , item.find_by_attribute(:id)
    assert_equal 1144, item.invoice_id
  end
  #449 is id in item,item id
  # 1144 is invoice_id in inv_it.csv

  def test_return_instances_of_merchant_associated_with_item
    skip
    assert_equal 23, item.merchant_id
    assert_equal "Item Sed Voluptas", name
  end

  # Transaction

  def test_returns_instance_of_invoice_associated_with_transaction
    skip
    assert_equal 1138, engine.transaction_repository.find_by_id
      invoice_customer = engine.customer_repository.find_by_id 192
      expect(transaction.invoice.customer.first_name).to eq invoice_customer.first_name
  end

  # Customer

  def test_returns_collection_of_invoices_associated_with_customer
    skip
    @engine.customer_repository.find_by_id 999
    assert_equal 7, customer.invoices.count
    assert_equal 999, invoice.customer.id
  end

end
