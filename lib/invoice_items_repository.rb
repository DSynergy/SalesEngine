require_relative 'MetaRepository'

class InvoiceItemsRepository < MetaRepository

  def initialize(filename)
    CSV.open(filename, headers: true, header_converters: :symbol)
  end

  

  def invoice
    # returns an instance of Invoice associated with this object
  end


  def item
    # returns an instance of Item associated with this object
  end


end
