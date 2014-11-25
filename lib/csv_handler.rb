require 'csv'

class CSVHandler

  attr_accessor :customers_repository,
                :invoices_repository,
                :invoice_items_repository,
                :items_repository,
                :merchants_repository,
                :transactions_repository

  attr_reader :data

  def initialize
    @customers_repository = CustomersRepository.new('customers.csv')
    @invoices_repository = InvoicesRepository.new('invoices.csv')
    @invoice_items_repository = InvoiceItemsRepository.new('invoice_items.csv')
    @items_repository = ItemsRepository.new('items.csv')
    @merchants_repository = MerchantsRepository.new('merchants.csv')
    @transactions_repository = TransactionsRepository.new('transactions.csv')
  end

    def load_file(filename="/event_attendees.csv")
      path = File.join(__dir__, filename)
      @contents = CSV.read(path, headers: true, header_converters: :symbol)
      @messages.file_load
    end


    def initialize(filename = 'garbage.csv', queue)
      @path = File.join('./bin/', filename)
      @queue = queue
    end
end
#
#
#       def startup(dir)
#         load_data(dir)
#       end
#       def startup_fixtures
#         load_data('./test/fixtures')
#       end
#       def load_data(path)
#         @customer_repository = CustomerRepository.new
#         @invoice_repository = InvoiceRepository.new
#         @invoice_item_repository = InvoiceItemRepository.new
#         @item_repository = ItemRepository.new
#         @merchant_repository = MerchantRepository.new
#         @transaction_repository = TransactionRepository.new
#       end
#
#       def load(file)
#         CSV.open(file, headers: true, header_converters: :symbol)
#       end
#       def save(file, row)
#         CSV.open(file, 'ab', headers: true, header_converters: :symbol) do |csv|
#           csv << row
#         end
#       end
#       private
#       def load_path_and_class(path, klass)
#         "#{path}/#{klass}s.csv"
#       end
#     end
#   end
# end
