# encoding: utf-8
Given(/^I pass "(.*?)" to the importer$/) do |filename|
  bawag = BawagConvert.new(filename)
end

Then(/^the result should be "(.*?)"$/) do |arg1|
  pending # express the regexp above with the code you wish you had
end