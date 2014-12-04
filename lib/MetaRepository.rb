require_relative 'sales_engine'

class MetaRepository

  def initialize(entries, engine)
    @engine = engine
    @entries = entries
  end

  def inspect
    "#<#{self.class} #{@merchants.size} rows>"
  end

  def all
    @entries
  end

  def random
    @entries.sample
  end

  def find_by_attribute(attribute, criteria)
    @entries.detect {|x| x.send(attribute.to_sym) == criteria}
  end

  def find_all_by_attribute(attribute, criteria)
    @entries.select {|x| x.send(attribute.to_sym) == criteria}
  end


end
