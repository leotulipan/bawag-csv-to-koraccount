# encoding: utf-8
Given(/^I pass "(.*?)" to the importer$/) do |filename|
  @bawag = BawagConvert.new(filename)
end

Then(/^the importer should return (.*?)$/) do |returnvalue|
  @bawag.import == returnvalue
end