# encoding: utf-8
begin

	class String
		def to_bool
			return true if self == true || self =~ (/(true|t|yes|y|1)$/i)
			return false if self == false || self.empty? || self =~ (/(false|f|no|n|0)$/i)
			raise ArgumentError.new("invalid value for Boolean: \"#{self}\"")
		end
	end

	# Library.add "directory"
 #  assert File.directory?("directory")

	rescue Exception => e
	
end

# encoding: utf-8
Given(/^I pass "(.*?)" to the importer$/) do |filename|
	#FileUtils.touch(filename)
   File.open(filename, "w") do |f|
      f.puts("99999999999;Bezahlung Maestro              10.10         MC/000000002 NEMMIT       0004  K2 21.01.UM 10.10 NEMMIT GMBHCOK\\WIEN\1 170           040EUREUR0   ;11.01.2014;11.01.2014;-11,99;EUR
")
      f.puts("99999999999;Gutschrift Überweisung                       VD/000000001 Amazon.Service S.A.R.L - EU-AT      19999 00011122233    ;10.01.2014;10.01.2014;+99,26;EUR")
    end	
	# if filename == "file.csv"
	#  unless File.readable?(filename)
	#  	#Should probably stub file open/check of bawag.import somewhere?
	#   #let(:file_like_object) { double("file like object") }
	# 	#File.stub(:open).and_return(file_like_object)
	# 	# For now I know that README.md exists, so changing filename accordingly
	# 	###   ***HACK***
	# 	filename = "README.md"
	#  end	
	# end
	
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