@GetBooking
Feature: Obtener BookingID

  Background:
    * url 'https://restful-booker.herokuapp.com/booking'
    * header Content-Type = 'application/json'
    * def credenciales = read('RequestToken.json')


  #Test para validar que la respuesta sea una lista y contenga datos
  Scenario: Obtener todos los Booking ID - Happypath
    When method GET
    Then status 200
    And  assert responseTime < 5000
    And  match response == '#[]'
    And  def size = karate.sizeOf(response)
    And  assert size > 0



  #Test para validar la respuesta ante un error de ednpoint
  Scenario: Obtener todos los Booking ID - SadPath
    Given url 'https://restful-booker.herokuapp.com/booking1'
    When method GET
    Then status 404
    And assert responseTime < 5000
    And match response == 'Not Found'



  #Test para validar la busqueda exitosa por nombre y apellido y que contenga registros disponibles
  Scenario Outline: Obtener todos los Booking por nombre y apellido - Happypath
    And path ''
    And param firstname = <firstname>
    And param lastname = <lastname>
    When method GET
    Then status 200
    And  assert responseTime < 5000
    And  match response == '#[]'


    Examples:
    |firstname  |lastname    |
    |"Jim"      |"Brown"     |



   #Test para validar la busqueda exitosa por fechas y que contenga registros disponibles
  Scenario Outline: Obtener todos los Booking por fecha de inicio y fin - Happypath
    And path ''
    And param checkin = <checkin>
    And param checkout = <checkout>
    When method GET
    Then status 200
    And  assert responseTime < 5000
    And  match response == '#[]'
    And  def size = karate.sizeOf(response)
    And  assert size > 0

    Examples:
      |checkin           |checkout         |
      |"2014-03-13"      |"2024-10-04"     |



    #Test para validar la busqueda exitosa por id y que contenga registros disponibles
  Scenario Outline: Obtener todos los Booking por ID - Happypath
    Given url 'https://restful-booker.herokuapp.com/booking'
    And path ''
    And param id = <id>
    When method GET
    Then status 200
    And  assert responseTime < 5000
    And  match response == '#[]'
    And  def size = karate.sizeOf(response)
    And  assert size > 0

      Examples:
      |id       |
      |"1"      |






