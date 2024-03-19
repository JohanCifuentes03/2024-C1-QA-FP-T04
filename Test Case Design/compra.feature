Feature: Compra de productos en Shopee Colombia

  Como usuario de Shopee Colombia
  Quiero comprar productos
  Para recibir los beneficios de la página y utilizar los productos

  Background:
    Given un usuario se encuentra registrado en la página de Shopee Colombia

  @happy_way
  Scenario: Compra de producto exitosa
    Given el usuario ha seleccionado un producto de interés
    When el usuario confirma la compra
    And valida sus credenciales correctamente
    Then debería recibir un mensaje de confirmación por correo electrónico

  @happy_way
  Scenario Outline: Compra de varios altavoces referencia JBL exitosa
    Given el usuario ha seleccionado el producto de interés
    And el usuario agrega <cantidad> altavoces referencia JBL
    When el usuario confirma la compra
    And valida sus credenciales
    Then debería recibir un mensaje de confirmación de <cantidad> altavoces por correo electrónico

    Examples:
      | cantidad |
      | 2        |
      | 3        |
      | 10       |
      | 20       |
      | 200      |
      | 500      |

  @exception
  Scenario: Intento de compra de productos fallido por falta de stocks disponible
    Given el usuario ha seleccionado un producto de interés
    And ha agregado la máxima cantidad de productos que permite el sistema 
    When el usuario intenta confirmar la compra 
    Then recibiría un mensaje de error indicando falta de stocks

  @exception
  Scenario: Intento de compra de productos fallido por falta carrito vacio
    Given el usuario no ha agregado ningun producto al carrito 
    When el usuario intenta confirmar la compra 
    Then recibiría un mensaje de "Carrito vacío"
