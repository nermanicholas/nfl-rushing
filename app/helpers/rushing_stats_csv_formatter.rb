require 'csv'

class RushingStatsCsvFormatter
  def self.build_csv(headers, rows)
    CSV.generate(headers: true) do |csv|
      csv << headers.keys

      rows.each do |row|
        csv << headers.values.map { |column| row.send(column) }
      end
    end
  end
end