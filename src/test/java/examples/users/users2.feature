@user
Feature: sample karate test script
  for help, see: https://github.com/intuit/karate/wiki/IDE-Support

  Background:
    * url 'https://jsonplaceholder.typicode.com'
    * def getUsers = karate.callSingle('classpath:examples/commons/users-commons.feature')

  Scenario: get all users and then get the first user by id

