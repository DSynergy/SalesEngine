require_relative 'test_helper'
require_relative '../lib/sales_engine.rb'

class IntegrationTest < Minitest::test


end






# class BusinessIntelligenceTest < Minitest::Test
#   def self.before_suite
#     SalesEngine::Database.startup('./data')
#     @@database = SalesEngine::Database
#     @@customer_repository ||= @@database.customer_repository
#     @@invoice_repository ||= @@database.invoice_repository
#     @@invoice_item_repository ||= @@database.invoice_item_repository
#     @@item_repository ||= @@database.item_repository
#     @@merchant_repository ||= @@database.merchant_repository
#     @@transaction_repository ||= @@database.transaction_repository
#   end
#   before_suite
#   def test_the_customer_transactions_method_successfully_returns_transactions
#     customer = customer_repository.find_by_id 2
#     assert_equal 1, customer.transactions.length
#     assert_equal SalesEngine::Transaction, customer.transactions.first.class
#   end
#   def test_the_customer_favorite_merchant_method_successfully_returns_a_merchant
#     customer = customer_repository.find_by_id 2
#     assert_equal "Shields, Hirthe and Smith", customer.favorite_merchant.name
#   end
#   def test_the_invoice_create_method_successfully_creates_an_invoice_and_items
#     customer = customer_repository.find_by_id(7)
#     merchant = merchant_repository.find_by_id(22)
#     items = (1..3).map { item_repository.random }
#     invoice = invoice_repository.create(customer: customer, merchant: merchant, items: items)
#     assert_equal merchant.id, invoice.merchant_id
#     assert_equal customer.id, invoice.customer_id
#   end
#   def test_the_invoice_charge_method_creates_a_transaction
#     invoice = invoice_repository.find_by_id(100)
#     prior_transaction_count = invoice.transactions.count
#     invoice.charge(credit_card_number: '1111222233334444', credit_card_expiration_date: "10/14", result: "success")
#     invoice = invoice_repository.find_by_id(invoice.id)
#     assert_equal prior_transaction_count + 1, invoice.transactions.count
#   end
#   def test_the_item_repository_most_revenue_method_returns_n_items_ranked_by_total_revenue
#     most = item_repository.most_revenue(5)
#     assert_equal "Item Dicta Autem", most.first.name
#     assert_equal "Item Amet Accusamus", most.last.name
#   end
#   def test_the_item_repository_most_items_method_returns_n_items_ranked_by_most_sold
#     most = item_repository.most_items(37)
#     assert_equal "Item Nam Magnam", most[1].name
#     assert_equal "Item Ut Quaerat", most.last.name
#   end
#   def test_the_item_best_day_method_returns_the_correct_date
#     item = item_repository.find_by_name "Item Accusamus Ut"
#     date = Date.parse "Sat, 24 Mar 2012"
#     assert_equal date, item.best_day.to_date
#   end
#   def test_the_merchant_repository_revenue_method_returns_all_data_for_a_specific_date
#     date = Date.parse "Tue, 20 Mar 2012"
#     revenue = merchant_repository.revenue(date)
#     assert_equal BigDecimal.new("2549722.91"), revenue
#   end
#   def test_the_merchant_repository_most_revenue_method_returns_the_top_n_revenue_earners
#     most = merchant_repository.most_revenue(3)
#     assert_equal "Dicki-Bednar", most.first.name
#     assert_equal "Okuneva, Prohaska and Rolfson", most.last.name
#   end
#   def test_the_merchant_repository_most_items_method_returns_the_top_n_items_sellers
#     most = merchant_repository.most_items(5)
#     assert_equal "Kassulke, O'Hara and Quitzon", most.first.name
#     assert_equal "Daugherty Group", most.last.name
#   end
#   def test_the_merchant_revenue_method_without_date_reports_all_revenue
#     merchant = merchant_repository.find_by_name "Dicki-Bednar"
#     assert_equal BigDecimal.new("1148393.74"), merchant.revenue
#   end
#   def test_the_merchant_revenue_method_with_a_date_reports_all_revenue_for_that_date
#     merchant = merchant_repository.find_by_name "Willms and Sons"
#     date = Date.parse "Fri, 09 Mar 2012"
#     assert_equal BigDecimal.new("8373.29"), merchant.revenue(date)
#   end
#   def test_the_merchant_favorite_customer_method_returns_the_customer_with_the_most_transactions
#     merchant = merchant_repository.find_by_name "Terry-Moore"
#     customer_names = [["Jayme", "Hammes"], ["Elmer", "Konopelski"], ["Eleanora", "Kling"],
#     ["Friedrich", "Rowe"], ["Orion", "Hills"], ["Lambert", "Abernathy"]]
#     customer = merchant.favorite_customer
#     assert customer_names.any? do |customer_name|
#       customer_name[0] == customer.first_name && customer_name[1] == customer.last_name
#     end
#   end
#   def test_the_merchant_customers_with_pending_invoices_method_returns_the_number_of_customers_with_pending_invoices
#     merchant = merchant_repository.find_by_name "Parisian Group"
#     customers = merchant.customers_with_pending_invoices
#     assert_equal 4, customers.count
#     assert customers.any? { |customer| customer.last_name == "Ledner" }
#   end
#   private
#   def database
#     @@database
#   end
#   def customer_repository
#     @@customer_repository
#   end
#   def invoice_repository
#     @@invoice_repository
#   end
#   def invoice_item_repository
#     @@invoice_item_repository
#   end
#   def item_repository
#     @@item_repository
#   end
#   def merchant_repository
#     @@merchant_repository
#   end
#   def transaction_repository
#     @@transaction_repository
#   end
# end
