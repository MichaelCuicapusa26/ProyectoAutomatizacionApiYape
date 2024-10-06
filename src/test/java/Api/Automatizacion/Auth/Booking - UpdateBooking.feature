@UpdateBooking
Feature: Actualizar Booking

  Background:
    * url 'https://restful-booker.herokuapp.com/booking'
    * header Content-Type = 'application/json'
    * header Accept = 'application/json'
    * def username = 'admin'
    * def password = 'password123'
    * def body = read('CreateBooking.json')
    * def parcialbody = read('ParcialRequest.json')



  #Test para validar que la respuesta  contenga datos -Update Parcial
  Scenario Outline: Actualizar Booking Parcial  - Happypath
    Given url 'https://restful-booker.herokuapp.com/booking/<id>'
    And header Authorization = call read('tokenB.js') {username:'admin',password:'password123'}
    And request parcialbody
    When method PATCH
    Then status 200
    And  assert responseTime < 5000
    And  def size = karate.sizeOf(response)
    And  assert size > 0

    Examples:
      |id     |
      |5      |

    #Test para validar que la respuesta sea una lista y contenga datos
    Scenario Outline: Actualizar Booking  - Happypath
    Given url 'https://restful-booker.herokuapp.com/booking/<id>'
    And header Authorization = call read('tokenB.js') {username:'admin',password:'password123'}
    And request body
    When method PUT
    Then status 200
    And  assert responseTime < 5000
    And  def size = karate.sizeOf(response)
    And  assert size > 0

    Examples:
      |id     |
      |3      |


   #Test para validar que la respuesta sea una lista y contenga datos
    Scenario: Actualizar Booking  - SadPath
    Given url 'https://restful-booker.herokuapp.com/booking/'
    And header Authorization = call read('tokenB.js') {username:'admin',password:'password123'}
    And request body
    When method PUT
    Then status 404
    And  assert responseTime < 5000
    And  def size = karate.sizeOf(response)
    And  assert size < 0