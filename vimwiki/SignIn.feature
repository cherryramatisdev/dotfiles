Feature: Sign in user

  Scenario: Make http request to https://app.tuotempo.com/api/v3/oauth/token
    When tuotempo return 200 OK and return it's access_token
    Then we'll generate our own JWT token with expiration to 30 minutes
    And return to the end user

    When tuotempo return 401 Unauthorized with a error
    Then we'll return the same 401 Unauthorized with error message to the end user
