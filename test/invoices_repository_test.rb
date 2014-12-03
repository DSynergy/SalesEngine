require_relative 'test_helper'
require '../lib/sales_engine'

class InvoicesRepositoryTest < Minitest::Test

  def setup
    @invoice_data         = CSVHandler.open_csv("../data/fixtures/invoices.csv")
    @invoices_repository  = InvoicesRepository.build_invoices(@invoice_data,self)
  end

  def test_it_can_load_invoices
    assert_equal 24, @invoices_repository.invoices.count
  end

  def test_it_returns_random_invoice
    count = 10.times.count do |i|
      random_invoice1 = @invoices_repository.random
      random_invoice2 = @invoices_repository.random
      random_invoice1 == random_invoice2
    end
    assert count < 2
  end

  def test_finds_single_invoice_by_id
    result = @invoices_repository.find_by_id(7)
    assert result.id, 7
  end

  def test_it_finds_multiple_invoices_by_customer_id
    result = @invoices_repository.find_all_by_customer_id(4)
    assert_equal 8, result.count
  end

  def test_it_can_find_by_status
    result = @invoices_repository.find_by_status('shipped')
    assert "shipped", result.status
  end

  def test_it_can_find_all_by_status
    result = @invoices_repository.find_all_by_status("shipped")
    assert 24, result.count
  end

end
