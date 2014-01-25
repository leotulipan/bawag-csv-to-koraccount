# Ruby 1.9.3
require 'csv'
#http://ruby-doc.org/stdlib-1.9.3/libdoc/csv/rdoc/CSV.html
require 'date'
#http://ruby-doc.org/stdlib-1.9.3/libdoc/date/rdoc/Date.html

basefile = 'file'
bank_input = CSV.read("#{basefile}.csv", {:col_sep=>";"})

# Read CSV
# Convert Date
# Output Zweck;Datum;Betrag

bank_input.each do |row|
  # print "-" + row[3] +"-\n"
   date = Date.strptime(row[3], '%d.%m.%Y')
   print date.strftime('%Y-%m-%d') +  ";" + row[1] + ";" + row[4] + "\n"
end

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