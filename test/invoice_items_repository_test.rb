require_relative 'test_helper'
require '../lib/csv_handler'
require '../lib/invoice_items_repository'

class InvoiceItemRepoTest < Minitest::Test

  def invoice_item_repository
    rows = CSVHandler.load("../data/fixtures/invoice_items.csv")
    invoice_item_repository = InvoiceItemsRepository.new("engine", rows)
  end

  def test_it_can_load_a_repo
    assert_equal 25, invoice_item_repository.invoice_items.length
  end

  def test_it_returns_basic_info
    information = invoice_item_repository.inspect
    assert_equal "#<InvoiceItemRepository 25 rows>", information
  end

  def test_it_returns_a_random_invoice_item
    random_invoice_item1 = invoice_item_repository.random
    random_invoice_item2 = invoice_item_repository.random
    refute random_invoice_item1 == random_invoice_item2
  end

  def test_it_returns_all_items_in_repo
    assert_equal 25, invoice_item_repository.all.count
  end

  def test_it_can_find_invoice_items_by_id
    result = invoice_item_repository.find_by_id(2)
    assert_equal 2, result.id
  end

  def test_it_can_find_invoice_items_by_item_id
    result = invoice_item_repository.find_by_item_id(523)
    assert_equal 523, result.item_id
  end

  def test_it_finds_invoice_items_with_a_specific_quantity
    result = invoice_item_repository.find_all_by_quantity(5)
    assert_equal 5, result.count
    result = invoice_item_repository.find_all_by_quantity(8)
    assert_equal 3, result.count
  end

  def test_it_finds_invoice_items_from_specific_invoice
    result = invoice_item_repository.find_all_by_invoice_id(2)
    assert_equal 4, result.count
    result = invoice_item_repository.find_all_by_invoice_id(4)
    assert_equal 2, result.count
  end

end
