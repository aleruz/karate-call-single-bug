@ignore
Feature: sample karate test script
  for help, see: https://github.com/intuit/karate/wiki/IDE-Support

  Background:

  Scenario:
    * def getUsers1 = karate.callSingle('classpath:examples/commons/users-commons-get1.feature')
    * print getUsers1
    * def getUsers2 = karate.callSingle('classpath:examples/commons/users-commons-get2.feature')
    * print getUsers2
    * def getUsers3 = karate.callSingle('classpath:examples/commons/users-commons-get3.feature')
    * print getUsers3
    * def createUsers = karate.callSingle('classpath:examples/commons/users-commons-internal.feature')
    * print createUsers
