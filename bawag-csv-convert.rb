#!ruby19
# encoding: utf-8
require 'csv'
#http://ruby-doc.org/stdlib-1.9.3/libdoc/csv/rdoc/CSV.html
require 'date'
#http://ruby-doc.org/stdlib-1.9.3/libdoc/date/rdoc/Date.html

basefile = 'file'
bank_input = CSV.read("#{basefile}.csv", {:col_sep=>";", :headers=>false, :encoding=>"ISO-8859-1:UTF-8"})

# Read CSV
# Convert Date
# Output Zweck;Datum;Betrag

CSV.open("#{basefile}.kor.csv", "wb", {:col_sep=>";", :headers=>true, :encoding=>"ISO-8859-1:UTF-8"}) do |csvout|
#     csv << ["row", "of", "CSV", "data"]
#     csv << ["another", "row"]
#     # ...
#   end
  csvout << ["Datum", "Zweck", "Betrag", "Wertstellung", "Belegnummer"]
  row = bank_input.first
  # bank_input.each do |row|
    # print "-" + row[3] +"-\n"
     date = Date.strptime(row[2], '%d.%m.%Y').strftime('%Y-%m-%d')
     valuta = Date.strptime(row[3], '%d.%m.%Y').strftime('%Y-%m-%d')
     csvout << [date , row[1] , row[4], valuta ]
  #end
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