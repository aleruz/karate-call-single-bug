@ignore
Feature: sample karate test script
  for help, see: https://github.com/intuit/karate/wiki/IDE-Support

  Background:
    * def getUsers = karate.callSingle('classpath:examples/commons/users-commons-get.feature')

  Scenario:
    * def createUsers = karate.callSingle('classpath:examples/commons/users-commons-internal.feature')
    * print createUsers
