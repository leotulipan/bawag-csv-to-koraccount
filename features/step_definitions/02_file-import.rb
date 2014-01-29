Given(/^I pass "(.*?)" to the importer$/) do |filename|
  bawag = BAWAG_convert.new(filename)
end

Then(/^the result should be "(.*?)"$/) do |arg1|
  pending # express the regexp above with the code you wish you had
end