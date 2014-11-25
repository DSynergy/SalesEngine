require_relative 'test_helper'

class InvoiceRepositoryTest < Minitest::Test

  def repository
    rows = CSVHandler.load("../data/fixtures/invoices.csv")
    repository = InvoiceRepository.new("engine", rows)
  end

  def test_it_can_load_invoices
    assert_equal 25, repository.invoices.length
  end

  def test_it_has_more_than_seven_invoices
    assert repository.count > 7
  end

  def test_it_returns_random_invoice
    random_invoice1 = repository.random
    random_invoice2 = repository.random
    refute random_invoice1 = random_invoice2
  end

  def test_finds_single_invoice_by_id
    result = repository.find_by_id(7)
    assert result.id, 7
  end

  def test_it_finds_multiple_invoices_by_customer_id
    result = repository.find_all_by_customer_id(4)
    assert_equal 8, result.count
  end

  def test_it_can_find_by_status
    result = repository.find_by_status('shipped')
    assert "shipped", result.status
  end

  def test_it_can_find_all_by_status
    result = repository.find_all_by_status("shipped")
    assert 24, result.count
  end

end
