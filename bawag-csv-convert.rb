#!ruby19
# encoding: utf-8
require 'csv'
#http://ruby-doc.org/stdlib-1.9.3/libdoc/csv/rdoc/CSV.html
require 'date'
#http://ruby-doc.org/stdlib-1.9.3/libdoc/date/rdoc/Date.html

banking_codes = [ "AT", "BG", "FE", "IG", "MC", "OG", "VB", "VD"]
basefile = 'file'
bank_input = CSV.read("#{basefile}.csv", {:col_sep=>";", :headers=>false, :encoding=>"ISO-8859-1:UTF-8"})

# Read CSV
# Convert Date, Valuedate
# Extract running Number
# Output "Datum", "Zweck", "Betrag", "Wertstellung", "Belegnummer"

CSV.open("#{basefile}.kor.csv", "wb", {:col_sep=>";", :headers=>true, :encoding=>"ISO-8859-1:UTF-8"}) do |csvout|
  csvout << ["Belegnummer", "Datum", "Zweck", "Betrag", "Wertstellung"]
  #row = bank_input.first
   bank_input.each do |row|
     # Standard case
     if banking_codes.include? row[1][45,2]
      count = row[1][48,9]

     # ;BG/000009999 Entgelt für Kontoführung    ;
     elsif banking_codes.include? row[1][0,2]
      count = row[1][3,9]

      #;uchungen      BG/000001195 Entgelt für händ. bearbeitete Buchungen            1 Stk.    ;
      #find anywhere  
      else
        extracted_string = row[1][/\s([A-Z][A-Z])\/\d\d\d\d\d\d\d\d\d/][1,12]
        if banking_codes.include? extracted_string[0,2] 
          count = extracted_string[3,9]
        else
         count =  ""
        end
     end

     date = Date.strptime(row[2], '%d.%m.%Y').strftime('%Y-%m-%d')
     valuta = Date.strptime(row[3], '%d.%m.%Y').strftime('%Y-%m-%d')
     csvout << [count, date , row[1] , row[4].gsub(/\./,""), valuta]
  end
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