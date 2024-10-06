@HealthCheck
Feature: Consultar funcionamiento

  Background:
    * url 'https://restful-booker.herokuapp.com'
    * def  ping = '/ping'
    * header Content-Type = 'application/json'
    * def credenciales = read('RequestToken.json')

  #Test para validar la correcta creacion de un token de consumo
  Scenario: Validar estado de api
    Given path ping
    And request credenciales
    When method GET
    Then status 201
    And assert responseTime < 5000
    And match response == "Created"


