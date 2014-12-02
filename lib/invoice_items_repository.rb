require_relative 'MetaRepository'
require_relative 'sales_engine'

class InvoiceItemsRepository < MetaRepository
  attr_reader :invoice_items, :engine

  def inspect
    "#<#{self.class} #{@invoice_items.size} rows>"
  end

  def self.build_invoice_items(data,engine)
    invoice_item_objects = data.map do |row|
      InvoiceItem.new(row,engine)
    end
    self.new(invoice_item_objects,engine)
  end


  def invoice
    @engine.invoice_item_relationships # returns an instance of Invoice associated with this object
  end


  def item
    @engine.invoice_item_relationships # returns an instance of Item associated with this object
  end


end
