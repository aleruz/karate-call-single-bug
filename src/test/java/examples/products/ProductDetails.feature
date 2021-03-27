@product
@requiresTestData
@upgrade
Feature: Product details

  Background:
    * configure cookies = karate.callSingle('classpath:commons/dex/DexAuth.feature').authCookie

    # let's fetch currency and language from the config for the base store and compare it with the one present in the product response
    * def feConfigurationResponse = karate.callSingle('classpath:commons/GetConfiguration.feature')
    * def activeCurrency = get[0] feConfigurationResponse.response.currencies[?(@.active == true)]
    * def activeLanguage = get[0] feConfigurationResponse.response.languages[?(@.active == true)]

    * def tenant = karate.properties['tenant']
    * def createProductTestDataResponse = karate.callSingle('classpath:examples/commons/product/CreateProductTestDataForCurrentTenant.feature')
    # get the data to use for the test from an endpoint.
    * def getProductDetailsDataResponse = karate.callSingle('classpath:examples/commons/product/GetProductDetailsData.feature', {tenant:tenant})

  Scenario: Check details for product
    * def expectedProperties = getProductDetailsDataResponse.response
    * call read('classpath:commons/product/GetProduct.feature') {productCode:'#(expectedProperties.code)'}

    * match $.price contains deep expectedProperties.priceData
    * match $.code == expectedProperties.code
    * match $.name == expectedProperties.name
    * match $.url == expectedProperties.url
    * match $.description == expectedProperties.description
    * match $.baseProductName == expectedProperties.baseProductName
    * match $.price.currencyIso == activeCurrency.isocode
    * match $.baseProduct == expectedProperties.baseProduct
    * match $.availability.code == expectedProperties.availability
    * match $.numberOfReviews == expectedProperties.numberOfReviews
    * match $.hideIfSoldOut == expectedProperties.hideIfSoldOut
    * match $.price == expectedProperties.priceData
    * match $.price.currencyIso == activeCurrency.isocode
    * match $.stock.stockLevelStatus == expectedProperties.stock.stockLevelStatus
