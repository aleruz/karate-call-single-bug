@ignore
Feature: Call an endpoint to create test data

  Background:
    * def config = read('classpath:general-config.json')
    * def createProductsTestDataEndpoint = config.endpoints.createProductsTestData

  @ignore
  # tenant: param from the calling feature
  # lang: param from the calling feature
  Scenario: Create products test data
    Given url createProductsTestDataEndpoint
    And form field storeUid = tenant
    And form field lang = lang
    And form field currency = currency
    And form field warehouse = warehouse
    And form field catVersion = catalogVersion
    # handles temporary hiccups
    And retry until responseStatus == 200
    When method POST
    Then status 200

