@crear
Feature: Crear Booking

  Background:
    * url 'https://restful-booker.herokuapp.com/booking'
    * header Content-Type = 'application/json'
    * header Accept = 'application/json'
    * def body = read('CreateBooking.json')


  #Test para validar la creacion de un booking - JSON
    Scenario: Crear un booking - Happypath
    Given path ''
    And request body
    When method POST
    Then status 200
    Then assert response.bookingid >= 0
    Then match response.booking.firstname != null
    Then match response.booking.lastname != ''

  