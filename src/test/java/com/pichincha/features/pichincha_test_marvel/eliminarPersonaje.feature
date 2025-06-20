@REQ_BDMNA-0001 @karate @Agente2 @BDMNA-0003-eliminarPersonaje
Feature: Consultar Personaje de Marvel

  Background:
    * configure ssl = true
    * header Content-Type = 'application/json'

    * def setUrlTest = 'http://bp-se-test-cabcd9b246a5.herokuapp.com/fagudelo/api/characters'

  @id:1 @eliminarPersonaje @eliminarExitosa204
  Scenario: T-API-BDMNA-0002-CA1-Eliminar personaje
    * def crearPersonaje =
      """
      function() {
        var request = karate.read('classpath:data/pichincha_test_marvel/create_request.json');
        var response = karate.call('classpath:com/pichincha/features/pichincha_test_marvel/crearPersonaje.feature@id:1', { jsonData: request });
        return response.response;
      }
      """
    * def personaje = call crearPersonaje
    * def personajeId = personaje.id

    * path username, 'api', 'characters', personajeId
    When method DELETE
    Then status 204

  @id:2 @eliminarPersonaje @noEncontrado404
  Scenario: T-API-BDMNA-0002-CA2-Eliminar personaje no existente 404
    * path username, 'api', 'characters', '9999'
    When method DELETE
    Then status 404
    And match response.error == 'Character not found'
