@token
Feature: Crear Token

  Background:
    * url 'https://restful-booker.herokuapp.com'
    * def  ruta_autho = '/auth'
    * header Content-Type = 'application/json'
    * def credenciales = read('RequestToken.json')

  #Test para validar la correcta creacion de un token de consumo
  Scenario: Crear y Validar Token Happy Path
  Given path ruta_autho
  And request credenciales
  When method post
  Then status 200
  And match $ == {"token":'#notnull' }
  And assert responseTime < 5000

  #Test para validar la respuesta ante un error de endPoint
  Scenario: Crear y Validar Token Sad Path - NotFound
    Given path ruta_autho +/1/
    And request credenciales
    When method post
    Then status 404
    And assert responseTime < 5000
    And match response == 'Not Found'


  #Test para validar la respuesta ante un igreso incorrecto de credenciales
  Scenario: Crear y Validar Token Sad Path - Bad Credentials
    * def badrequest =
    """
    {
      "username" : "3123213",
      "password" : "eqweqw"
    }
    """
    Given path ruta_autho
    And request badrequest
    When method post
    Then status 200
    And assert responseTime < 5000
    And match $ == {"reason": "Bad credentials" }


