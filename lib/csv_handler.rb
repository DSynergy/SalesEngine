require 'csv'

class CSVHandler

  def self.open_csv(filename)
    CSV.open(filename, headers: true, header_converters: :symbol)
  end

end
