@REQ_BDMNA-0001 @karate @Agente2 @BDMNA-0001-crearPersonaje
Feature: Consultar Personaje de Marvel

  Background:
    * configure ssl = true
    * header Content-Type = 'application/json'

    * def setUrlTest = 'http://bp-se-test-cabcd9b246a5.herokuapp.com/fagudelo/api/characters'

  @id:1 @crearPersonaje @CreacionExitosa201
  Scenario: T-API-BDMNA-0001-CA1-Crear personaje exitosamente 201
    And request jsonData
    When method POST
    Then status 201
    And match response != null

  @id:2 @crearPersonaje @nombreDuplicado400
  Scenario: T-API-BDMNA-0001-CA2-Crear personaje con nombre duplicado 400
    * def jsonData = read('classpath:data/pichincha_test_marvel/create_request.json')
    And request jsonData
    When method POST
    Then status 400
    And match response.error == 'Character name already exists'

  @id:3 @crearPersonaje @faltanDatosRequeridos400
  Scenario: T-API-BDMNA-0001-CA3-Crear personaje con datos inválidos 400
    * def jsonData = read('classpath:data/pichincha_test_marvel/empty_request.json')
    And request jsonData
    When method POST
    Then status 400
    And match response.name == 'Name is required'
    And match response.description == 'Description is required'
    And match response.powers == 'Powers are required'
    And match response.alterego == 'Alterego is required'
