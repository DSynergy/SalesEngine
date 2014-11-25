require 'csv'

class CSVHandler
  attr_reader :data

  def initialize(filename)
    @data = CSV.open(filename, headers: true, header_converters: :symbol)
  end

end
