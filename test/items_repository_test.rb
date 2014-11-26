require_relative 'test_helper'
require '../lib/csv_handler'
require '../lib/items_repository'

class ItemsRepositoryTest < Minitest::Test

  def item_repository
    rows = CSVHandler.load("../data/fixtures/items.csv")
    item_repository = ItemsRepository.new('engine', rows)
  end

  def test_it_can_load_a_repository
    assert_equal 25, item_repository.items.length
  end

  def test_it_returns_basic_information
    information = item_repository.inspect
    assert_equAL "#<ItemRepository 25 rows>", information
  end

  def test_it_returns_a_random_item
    random_item1 = item_repository.random
    random_item2 = item_repository.random
    refute random_item1 ==random_item2
  end

  def test_it_finds_items_by_id
    result = item_repository.find_by_id(1)
    assert_equal 1, result.id
  end

  def test_it_can_find_all_items_by_merchant_id
    result = item_repository.find_all_by_merchant_id(2)
    assert_equal 10, result_count
  end

  def test_it_finds_items_by_name
    result = item_repository.find_by_name("Item Autem Minima")
    assert_equal "Item Autem Minima", result.name
  end
end
