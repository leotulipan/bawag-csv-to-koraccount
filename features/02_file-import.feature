#encoding: utf-8
Feature: Importing and sanitizing/checking the original file
	In order to open a BAWAG csv file we wan't to check if the file exists
	and avoid simple mistakes like empty fields or wrong number of columns

Scenario: Nonexisting file
	Given I pass "nonexistant.XXX" to the importer
	Then the importer should return false

Scenario: Existing file	
	Given I pass "file.csv" to the importer
	Then the importer should return true 

Scenario: Saving import result	
	Given I pass "file.csv" to the importer
	And I save the import result
	Then the file "file.kor.csv" should be created