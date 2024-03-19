Feature: Consulta de moneda de pago de países extranjeros

  Como vendedor en la plataforma Shopee Colombia,
  Quiero poder consultar la moneda de pago utilizada por clientes extranjeros
  Para mejorar la gestión de envíos y ventas internacionales.

  Background: 
    Given e un vendedor está utilizando el servicio de consulta de monedas de pago de Shopee

  @happy_way
  Scenario Outline: Consulta de moneda de pago por código de país extranjero
    When el usuario ingresa el código <countryCode> de un país en el servicio de consulta
    And ejecuta la consulta
    Then debería recibir la moneda de pago en el código <ISOcode> y su denominación <currency>
    And recibir un código de estado 200, indicando un proceso exitoso.

    Examples:
      | countryCode | ISOcode | currency |
      | USA         | USD     | Dólares  |  
      | AD          | EUR     | Euro     |  
      | AR          | ARS     | Pesos argentinos    |  

  @exception
  Scenario Outline: Consulta fallida de moneda de pago por código de país inexistente
    When el usuario ingresa un código de país countryCode> que no existe en el servicio de consulta
    And ejecuta la consulta
    Then debería recibir un mensaje de error indicando que el país no fue encontrado
    And recibir un código de estado 404, indicando que el campo no fue encontrado.

    Examples:
      | countryCode |
      | AÑÑ         |  
      | A.          |

  @exception
  Scenario Outline: Consulta fallida de moneda de pago por formato incorrecto del código de país
    When el usuario ingresa un código de país <countryCode> con un formato incorrecto en el servicio de consulta
    And ejecuta la consulta
    Then debería recibir un mensaje de error indicando que el formato del código es incorrecto
    And recibir un código de estado 400, indicando una solicitud incorrecta.

    Examples:
      | countryCode |
      | 123         |  
      | 0.1         |
      | 3213.1      |
      | True        |
      | False       |
