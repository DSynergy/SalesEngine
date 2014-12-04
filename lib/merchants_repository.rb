require_relative 'MetaRepository'
require_relative 'sales_engine'

class MerchantsRepository < MetaRepository
  attr_reader :entries, :engine

  def inspect
    "#<#{self.class} #{@merchants.size} rows>"
  end

  def self.build_merchants(data,engine)
    merchant_objects = data.map do |row|
      Merchant.new(row,engine)
    end
    self.new(merchant_objects,engine)
  end

  def merchants
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

end
