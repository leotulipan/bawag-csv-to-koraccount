#encoding: utf-8
Feature: Showcase the simplest possible Cucumber scenario
  In order to verify that cucumber is installed and configured correctly
  As an aspiring BDD fanatic 
  I should be able to run this scenario and see that the steps pass (green like a cuke)
 
  Scenario: Cucumber is run
    Given cucumber is called on the command line
    When cucumber runs
    Then I have to write step definitions