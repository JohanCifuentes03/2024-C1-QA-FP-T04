Feature: Registro e inicio de sesion de nuevo usuario en la plataforma Shopee Colombia 

    Yo como vendedor 
    Quiero registrarme en la plataforma de Shopee Colombia
    Para vender mis productos

    Background: 
      Given un usuario esta en la plataforma principal de Shopee Colombia


  
    @happy_way
    Scenario: Inicio de sesión exitoso
      Given el usuario ingresa al modulo de inicio de sesión de Shopee Colombia
      When ingresa sus credenciales correctamente 
      And valida
      Then seria redirijido a la plataforma de compras de Shopee Colombia

    @exception 
    Scenario: Intento inicio de sesión fallido por correo erroneo
      Given el usuario ingresa al modulo de inicio de sesión de Shopee Colombia
      When ingresa un correo inexistente 
      Then recibiría un mensaje de correo inexistente o incorrecto


    @exception 
    Scenario: Intento inicio de sesión fallido por contrasena incorrecta
      Given el usuario ingresa al modulo de inicio de sesión de Shopee Colombia
      When ingresa un correo valido
      But una contrasena incorrecta
      Then recibiría un mensaje de contrasena incorrecta

    @exception 
    Scenario: Intento de registro fallido por numero repetido
      Given el usuario ingresa al modulo de registro de Shopee Colombia
      When ingresa sus credenciales correctamente 
      And valida
      But su numero de telefono ya estaba registrado
      Then No podria contuniar el registro
