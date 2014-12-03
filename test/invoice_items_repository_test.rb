require_relative 'test_helper'
require '../lib/sales_engine'

class InvoiceItemsRepoTest < Minitest::Test

  def setup
    @invoice_items_data       = CSVHandler.open_csv("../data/fixtures/invoice_items.csv")
    @invoice_items_repository = InvoiceItemsRepository.build_invoice_items(@invoice_items_data,self)
  end

  def test_it_can_load_a_repo
    assert_equal 24, @invoice_items_repository.invoice_items.count
  end

  def test_it_returns_a_random_invoice_item
    random_invoice_item1 = @invoice_items_repository.random
    random_invoice_item2 = @invoice_items_repository.random
    refute random_invoice_item1 == random_invoice_item2
  end

  def test_it_can_find_invoice_items_by_id
    result = @invoice_items_repository.find_by_id(2)
    assert_equal 2, result.id
  end

  def test_it_can_find_invoice_items_by_item_id
    skip
    result = @invoice_items_repository.find_by_item_id(523)
    assert_equal 523, result.item_id
  end

  def test_it_finds_invoice_items_with_a_specific_quantity
    skip
    result = @invoice_items_repository.find_all_by_quantity(5)
    assert_equal 5, result.count
    result = @invoice_items_repository.find_all_by_quantity(8)
    assert_equal 3, result.count
  end

  def test_it_finds_invoice_items_from_specific_invoice
    skip
    result = @invoice_items_repository.find_all_by_invoice_id(2)
    assert_equal 4, result.count
    result = @invoice_items_repository.find_all_by_invoice_id(4)
    assert_equal 2, result.count
  end

end
