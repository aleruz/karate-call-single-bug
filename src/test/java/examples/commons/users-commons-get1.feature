@ignore
Feature: sample karate test script
  for help, see: https://github.com/intuit/karate/wiki/IDE-Support

  Background:
    * url 'https://jsonplaceholder.typicode.com'
    * def pause = function(pause){ java.lang.Thread.sleep(pause) }


  Scenario: get all users and then get the first user by id
    * pause(5000)
    Given path 'users'
    When method get
    Then status 200

    * def first = response[0]
    * pause(10000)

    Given path 'users', first.id
    When method get
    Then status 200


