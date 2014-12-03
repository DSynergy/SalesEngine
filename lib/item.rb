require_relative 'items_repository'

class Item
  attr_reader :engine, :id, :name, :description, :merchant_id, :unit_price, :created_at, :updated_at

  def initialize(data,engine)
    @id = data[:id].to_i
    @name = data[:name]
    @description = data[:description]
    @unit_price = data[:unit_price].to_i
    @merchant_id = data[:merchant_id].to_i
    @created_at = data[:created_at]
    @updated_at = data[:updated_at]
    @engine = engine


  end



def best_day
  # returns the date with the most sales for the given item using the invoice date
end

end
