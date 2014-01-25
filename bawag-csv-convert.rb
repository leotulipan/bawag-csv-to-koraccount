# Ruby 1.9.2
require 'csv'
  
basefile = 'file'
bank_input = CSV.read("#{basefile}.csv", {:col_sep=>";"})

# Qif::Writer.open("#{basefile}.qif", type = 'Bank', format = 'dd.mm.yyyy') do |qif|
#   bank_input.each do |row|
#     # Fix the values depending on what state your CSV data is in
#     row.each { |value| value.to_s.gsub!(/^\s+|\s+$/,'') }
#     qif << Qif::Transaction.new(
#       :date         => row[2].gsub!(/.([12][90]\d\d)/) do "'" + $1
#       end,
#       :amount       => row[4],
#       :memo         => row[1]
#     )
#   end
# end