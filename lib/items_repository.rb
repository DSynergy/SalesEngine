require_relative 'MetaRepository'
require_relative 'sales_engine'

class ItemsRepository < MetaRepository
    attr_reader :items, :engine

    def inspect
      "#<#{self.class} #{@items.size} rows>"
    end

    def self.build_items(data,engine)
      item_objects = data.map do |row|
        Item.new(row,self)
      end
      self.new(item_objects,self)
    end


  def invoice_items
    @engine.item_relationships # returns a collection of InvoiceItems associated with this object
  end


  def merchant
    @engine.item_relationships # returns an instance of Merchant associated with this object  end
  end

  ####Business logic#####

  def most_revenue(x)
    # returns the top x item instances ranked by total revenue generated
  end

  def most_items(x)
    # returns the top x item instances ranked by total number sold
  end


end
