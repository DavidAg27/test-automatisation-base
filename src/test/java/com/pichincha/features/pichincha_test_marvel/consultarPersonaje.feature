@REQ_BDMNA-0001 @karate @Agente2 @BDMNA-0002-consultarPersonaje
Feature: Consultar Personaje de Marvel

  Background:
    * configure ssl = true
    * header Content-Type = 'application/json'

    * def setUrlTest = 'http://bp-se-test-cabcd9b246a5.herokuapp.com/fagudelo/api/characters'

@id:1 @consultarPersonaje @ConsultaExitosa200
  Scenario: T-API-BDMNA-0002-CA1-Consultar Personaje de Marvel exitosamente
    Given url setUrlTest
    When method GET
    Then status 200
    *  print "Iniciando la consulta del personaje de Marvel"
    *  print response
    *  def totalRecords = response.meta.pagination.totalRecords
    *  print totalRecords
    And match response != null

  @id:2 @consultarPersonajePorId @ConsultaExitosa200
  Scenario: T-API-BDMNA-0002-CA2-Consultar Personaje de Marvel por ID exitosamente
    Given url setUrlTest + '/1'
    When method GET
    Then status 200
    *  print "Iniciando la consulta del personaje de Marvel"
    *  print response
    And match response != null
    And match response.id == 1


  @id:3 @consultarPersonajePorId @Error400
  Scenario: T-API-BDMNA-0001-CA1-Consultar Personaje de Marvel por ID no encontrado 400
    Given url setUrlTest + '/9999'
    When method GET
    Then status 404
    *  print "Iniciando la consulta del personaje de Marvel"
    *  print response
