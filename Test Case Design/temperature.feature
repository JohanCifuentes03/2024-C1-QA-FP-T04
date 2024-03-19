Feature: Convertir grados Celsius a grados Fahrenheit

  Como usuario de Shopee Colombia 
  Quiero hacer uso del servicio de conversión de temperatura de Shopee
  Para hacer la equivalencia de las temperaturas 

  Background: 
    Given un usuario está utilizando el servicio de conversión de temperatura de Shopee

  @happy_way
  Scenario Outline: Convertir Celsius a Fahrenheit
    When el usuario ingresa <celsius> grados Celsius al servicio
    And corre el servicio
    Then recibiría una respuesta "OK" 
    And se mostraría el valor de <fahrenheit> grados Fahrenheit

    Examples:
      | celsius | fahrenheit |
      | 12      | 53.6       | 
      | 30      | 86         |
      | 100     | 212        |
      | -10     | 14         |


  @exception
  Scenario Outline: Intento de conversión fallido por tipo de dato incorrecto
    When el usuario ingresa el caracter <caracter> en el servicio
    And corre el servicio
    Then recibiría una respuesta "Bad Request" 
    And  se mostraría mensaje de error

    Examples:
      | celsius | 
      | a       |  
      | b       | 
      | ñ       | 