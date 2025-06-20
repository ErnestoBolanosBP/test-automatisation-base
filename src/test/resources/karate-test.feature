Feature: HU-TEM-0001 - Gestion de personajes Marvel

@ObtenerTodosLosPersonajes
Scenario: Obtener todos los personajes
	Given url 'http://bp-se-test-cabcd9b246a5.herokuapp.com/cbolanos/api/characters'
	When method get
	then status 200
	
@ObtenerPersonajePorId
Scenario: Obtener personaje por ID
	Given url http://bp-se-test-cabcd9b246a5.herokuapp.com/cbolanos/api/characters/1'
	When method get
	then status 200
	and match response.id == 1

@CrearPersonajeDuplicado
Scenario: Crear personaje con nombre duplicado
	Given url ' http://bp-se-test-cabcd9b246a5.herokuapp.com/cbolanos/api/characters'
	and request {name: 'Iron Man', alterego: 'Otro', description: 'Otro', powers: {'Armor'}}
	and header Content-Type = 'application/json'
	when method post
	then status 400
	and match response == {error: 'Character name already exists'}