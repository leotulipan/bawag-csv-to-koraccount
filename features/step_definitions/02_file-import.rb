begin

	class String
		def to_bool
			return true if self == true || self =~ (/(true|t|yes|y|1)$/i)
			return false if self == false || self.empty? || self =~ (/(false|f|no|n|0)$/i)
			raise ArgumentError.new("invalid value for Boolean: \"#{self}\"")
		end
	end

rescue Exception => e
	
end

# encoding: utf-8
Given(/^I pass "(.*?)" to the importer$/) do |filename|

	if filename == "file.csv"
	 unless File.readable?(filename)
	 	#Should probably stub file open/check of bawag.import somewhere?
	  #let(:file_like_object) { double("file like object") }
		#File.stub(:open).and_return(file_like_object)
		# For now I know that README.md exists, so changing filename accordingly
		###   ***HACK***
		filename = "README.md"

	 end	
	end
	
  @bawag = BawagConvert.new(filename)
end

Then(/^the importer should return (.*?)$/) do |returnvalue|
  @bawag.import.should == returnvalue.to_bool
end