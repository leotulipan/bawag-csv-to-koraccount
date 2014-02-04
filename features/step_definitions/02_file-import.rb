# encoding: utf-8
begin


	rescue Exception => e
	
end

# encoding: utf-8
Given(/^I pass "(.*?)" to the importer$/) do |filename|
	
	unless filename == "nonexistant.XXX" 
   File.open(filename, "w") do |f|
      f.puts("99999999999;Bezahlung Maestro              10.10         MC/000000002 NEMMIT       0004  K2 21.01.UM 10.10 NEMMIT GMBHCOK\\WIEN\1 170           040EUREUR0   ;11.01.2014;11.01.2014;-11,99;EUR
")
      f.puts("99999999999;Gutschrift Überweisung                       VD/000000001 Amazon.Service S.A.R.L - EU-AT      19999 00011122233    ;10.01.2014;10.01.2014;+99,26;EUR")
    end	
  end
	
  @bawag = BawagConvert.new(filename)
end

Then(/^the importer should return (.*?)$/) do |returnvalue|
  @bawag.import.should == returnvalue.to_bool
end

Given(/^I save the import result$/) do
  @bawag.save.should == true
end

Then(/^the file "(.*?)" should be created$/) do |filename|
  File.readable?(filename)
end