require_relative 'test_helper'
require '../lib/sales_engine'

class ItemsRepositoryTest < Minitest::Test

  def setup
    @item_data        = CSVHandler.open_csv("../data/fixtures/items.csv")
    @items_repository = ItemsRepository.build_items(@item_data,self)
  end

  def test_it_loaded_fixtures
    assert_equal 24, @items_repository.items.count
  end

  def test_it_returns_a_random_item
    count = 10.times.count do |i|
      random_item1 = @items_repository.random
      random_item2 = @items_repository.random
      random_item1 == random_item2
    end
    assert count < 2

  end

  def test_it_finds_items_by_id
    result = @items_repository.find_by_id(1)
    assert_equal 1, result.id
  end

  def test_it_can_find_all_items_by_merchant_id
    result = @items_repository.find_all_by_merchant_id(2)
    assert_equal 9, result.count
  end

  def test_it_can_find_an_item_by_unit_price
    result = @items_repository.find_by_unit_price(67076)
    assert_equal "Item Autem Minima", result.name
  end

  def test_it_finds_items_by_name
    result = @items_repository.find_by_name("Item Autem Minima")
    assert_equal "Item Autem Minima", result.name
  end
end
