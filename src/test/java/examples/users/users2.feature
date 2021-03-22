@user
Feature: sample karate test script
  for help, see: https://github.com/intuit/karate/wiki/IDE-Support

  Background:
    * def getUsers = karate.callSingle('classpath:examples/commons/users-commons-get3.feature')

  Scenario: get all users and then get the first user by id
    # try to simulate the calling of a feature which is also called in a subfeature
    * def getUsers = karate.callSingle('classpath:examples/commons/users-commons-get1.feature')
    * def getUsers = karate.callSingle('classpath:examples/commons/users-commons.feature')

