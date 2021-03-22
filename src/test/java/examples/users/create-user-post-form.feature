@create-user-post
Feature: sample karate test script
  for help, see: https://github.com/intuit/karate/wiki/IDE-Support

  Scenario: create user using form in POST
    Given url 'https://jsonplaceholder.typicode.com/users'
    And form field user = 'test'

    When method post
    Then status 201

    * json resp = response
    * print response.id

    # logging will show something like:
    # 1 > POST https://jsonplaceholder.typicode.com/users
    # 1 > Content-Type: application/x-www-form-urlencoded
    # 1 > Content-Length: 9
    # 1 > Host: jsonplaceholder.typicode.com
    # 1 > Connection: Keep-Alive
    # 1 > User-Agent: Apache-HttpClient/4.5.13 (Java/11.0.7)
    # 1 > Accept-Encoding: gzip,deflate

    # while in 0.9.6 it would have been

    # logging will show something like:
    # 1 > POST https://jsonplaceholder.typicode.com/users
    # 1 > Content-Type: application/x-www-form-urlencoded
    # 1 > Content-Length: 9
    # 1 > Host: jsonplaceholder.typicode.com
    # 1 > Connection: Keep-Alive
    # 1 > User-Agent: Apache-HttpClient/4.5.13 (Java/11.0.7)
    # 1 > Accept-Encoding: gzip,deflate
    # user=test

    # So actually there is no logs for the param




