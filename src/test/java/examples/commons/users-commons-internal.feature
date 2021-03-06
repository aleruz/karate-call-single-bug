@ignore
Feature: sample karate test script
  for help, see: https://github.com/intuit/karate/wiki/IDE-Support

  Background:
    * url 'https://jsonplaceholder.typicode.com'
    * def pause = function(pause){ java.lang.Thread.sleep(pause) }
    # add a read of a json configuration
    * def config = read('classpath:general-config.json')
    * def getUsers3 = karate.call('classpath:examples/commons/users-commons-get4.feature')

  Scenario: create a user and then get it by id
    * def user =
      """
      {
        "name": "Test User",
        "username": "testuser",
        "email": "test@user.com",
        "address": {
          "street": "Has No Name",
          "suite": "Apt. 123",
          "city": "Electri",
          "zipcode": "54321-6789"
        }
      }
      """

    Given url 'https://jsonplaceholder.typicode.com/users'
    And form field user = 'test'

    And request user
    When method post
    Then status 201

    * def id = response.id
    * print 'created id is: ', id




