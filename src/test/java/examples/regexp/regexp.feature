@regex
Feature: test regexp

  Scenario:
    * def regex = '#regex /\\w{2}/search'
    * def value = '/de/search'
    * match value == regex


    * def regexWithEntities = '#regex /\\w{2}/search\\.\\*'
    * def valueWithEntities = '/de/search.*'
    * match valueWithEntities == regexWithEntities

    # was working in 0.9.6
    # Now error is:
    #
    # org.opentest4j.AssertionFailedError:
    # Unexpected internal error near index 14
    # /\w{2}/search\
    #
    # Seems the double \\ before the '?' is not taken correctly.
    * def regexWithEntities = '#regex /\\w{2}/search\\?q=(.*?)'
    * def valueWithEntities = '/de/search?q=test'
    * match valueWithEntities == regexWithEntities
