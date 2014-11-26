require_relative 'MetaRepository'

class InvoiceItemsRepository < MetaRepository
  attr_reader :invoice_items

  def initialize(invoice_items)
    @invoice_items = invoices_items
  end

  def self.build_invoice_items(data)
    invoice_item_objects = data.map do |row|
      InvoiceItem.new(row)
    end
    self.new(invoice_item_objects)
  end


  def invoice
    # returns an instance of Invoice associated with this object
  end


  def item
    # returns an instance of Item associated with this object
  end


end
