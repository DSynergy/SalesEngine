require_relative 'MetaRepository'
require_relative 'sales_engine'

class InvoiceItemsRepository < MetaRepository
  attr_reader :engine, :entries

  def inspect
    "#<#{self.class} #{@invoice_items.size} rows>"
  end

  def self.build_invoice_items(data,engine)
    invoice_item_objects = data.map do |row|
      InvoiceItem.new(row,engine)
    end
    self.new(invoice_item_objects,engine)
  end

  def invoice_items
    @entries
  end

  def find_by_id(id)
    find_by_attribute(:id, id)
  end

  def find_by_item_id(itemid)
    find_by_attribute(:item_id, itemid)
  end

  def find_all_by_quantity(quantity)
    find_all_by_attribute(:quantity, quantity)
  end

  def find_all_by_invoice_id(id)
    find_all_by_attribute(:invoice_id, id)
  end

  def invoice
    @engine.invoice_item_relationships # returns an instance of Invoice associated with this object
  end

  def item
    @engine.invoice_item_relationships # returns an instance of Item associated with this object
  end


end
