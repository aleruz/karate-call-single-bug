@text-javascript-response
Feature: Test API when returning text/javascript as content-type

  Scenario:
    Given url 'https://accounts.eu1.gigya.com/accounts.initRegistration?apiKey=3_ufdsfsdfdsfdsfsdfsdfdsfsdfdsfsd'
    And method GET
    And match responseHeaders['content-type'][0] == 'text/javascript; charset=utf-8'
    And match responseType == 'string'
    * print response
    * json resp = response
    * match resp.statusCode == 400

