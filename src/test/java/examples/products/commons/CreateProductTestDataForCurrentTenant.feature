@ignore
Feature: Create product test data for current tenant

  Background:
   * def pause = function(pause){ java.lang.Thread.sleep(pause) }

  Scenario:
    # let's fetch currency and language from the config for the base store and compare it with the one present in the product response
    * def feConfigurationResponse = karate.callSingle('classpath:commons/GetConfiguration.feature')
    * def activeCurrency = get[0] feConfigurationResponse.response.currencies[?(@.active == true)]
    * def activeLanguage = get[0] feConfigurationResponse.response.languages[?(@.active == true)]

    * def tenant = karate.properties['tenant']
    * def baseStoreInfoResponse = karate.callSingle('classpath:examples/commons/product/GetBaseStoreInfo.feature', {tenant:tenant})
    * def baseStoreInfo = baseStoreInfoResponse.baseStoreInfo
    * def warehouse = baseStoreInfo.warehouse
    * def createProductTestDataStagedCatalogResponse = karate.call('classpath:examples/commons/product/CreateProductTestData.feature', {tenant:tenant, lang:activeLanguage.isocode, currency:activeCurrency.isocode, warehouse:warehouse, catalogVersion:'Staged'})
    * def createProductTestDataResponse = karate.call('classpath:examples/commons/product/CreateProductTestData.feature', {tenant:tenant, lang:activeLanguage.isocode, currency:activeCurrency.isocode, warehouse:warehouse, catalogVersion:'Online'})
    # a small pause is needed because there is a cache in place which needs to be evicted
    * pause(2000)
