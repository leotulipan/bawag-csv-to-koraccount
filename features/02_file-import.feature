#encoding: utf-8
Feature: Importing and sanitizing/checking the original file
	In order to open a BAWAG csv file we wan't to check if the file exists
	and avoid simple mistakes like empty fields or wrong number of columns

Scenario: Nonexistant file
	Given I pass "nonexistant.XXX" to the importer
	Then the result should be "File not found"
 