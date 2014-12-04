require_relative 'MetaRepository'
require_relative 'sales_engine'

class ItemsRepository < MetaRepository
  attr_reader :engine, :entries

  def inspect
    "#<#{self.class} #{@items.size} rows>"
  end

  def self.build_items(data,engine)
    item_objects = data.map do |row|
      Item.new(row,self)
    end
    self.new(item_objects,self)
  end

  def items
    @entries
  end

  def find_by_id(id)
    find_by_attribute(:id, id)
  end

  def find_by_name(name)
    find_by_attribute(:name, name)
  end

  def find_all_by_name(name)
    find_all_by_attribute(:name, name)
  end

  def find_all_by_merchant_id(merchant_id)
    find_all_by_attribute(:merchant_id, merchant_id)
  end

  def find_by_unit_price(price)
    find_by_attribute(:unit_price, price)
  end

end


  ####Business logic#####
  #
  # def most_revenue(x)
  #   # returns the top x item instances ranked by total revenue generated
  # end
  #
  # def most_items(x)
  #   # returns the top x item instances ranked by total number sold
  # end
