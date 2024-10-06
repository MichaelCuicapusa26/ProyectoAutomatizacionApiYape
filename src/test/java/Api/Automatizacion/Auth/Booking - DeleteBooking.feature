@DeleteBooking
Feature: Obtener BookingID

  Background:
    * url 'https://restful-booker.herokuapp.com/booking'
    * header Content-Type = 'application/json'
    * def username = 'admin'
    * def password = 'password123'
    * def credenciales = read('RequestToken.json')
    * def result = callonce read('Booking - CreateBooking.feature')
    * print result.response
    * def id = result.response.bookingid
    * print id


  #Test para validar la eliminacion de un booking
  Scenario: Eliminar un booking - Happypath
    Given path , "/",id,"/"
    And header Authorization = call read('tokenB.js') {username:'admin',password:'password123'}
    When method DELETE
    Then status 201
    And match response == "Created"


    #Test para validar la eliminacion de un booking
  Scenario: Eliminar un booking - BadPath
    Given path , "/","999","/"
    And header Authorization = call read('tokenB.js') {username:'admin',password:'password123'}
    When method DELETE
    Then status 405
    And match response == "Method Not Allowed"


