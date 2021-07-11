Class {
	#name : #Administrador,
	#superclass : #User,
	#instVars : [
		'lugares',
		'insumos',
		'combis',
		'rutas'
	],
	#category : #'ING2-COMBI19-Modelo'
}

{ #category : #initialization }
Administrador class >> initializeCon: unNombre apellido: unApellido mail: unEmail contraseña: unaContraseña [
	| instance |
	instance := self new.
	instance 
		initializeCon: unNombre
		apellido: unApellido
		mail: unEmail
		contraseña: unaContraseña.
	^instance
]

{ #category : #accessing }
Administrador >> agregarCombi: unaCombi [
	(combis anySatisfy: [ :vehiculo | vehiculo == unaCombi ])
		ifFalse:[ combis add: unaCombi.
					 ^ true ] .
		^false
]

{ #category : #'as yet unclassified' }
Administrador >> agregarCombiModelo: unModelo patente: unaPatente cantidadAsientos: unaCantidad chofer: unChofer tipo: unTipo [
	"Chequea que no exista una combi con una patente igual, si no existe, crea la combi la agrega a la coleccion y devuelve un booleano confirmando."

	combis
		ifNotNil: [ (combis anySatisfy: [ :unaCombi | unaCombi patente = unaPatente ])
				ifTrue: [ ^ false ];
				ifFalse: [ combis
							add:
								(Combi
									initializeModelo: unModelo
									patente: unaPatente
									asientos: unaCantidad
									chofer: unChofer
									tipo: unTipo).
						^ true ] ].
	"combis
		add:
			(Combi
				initializeModelo: unModelo
				patente: unaPatente
				asientos: unaCantidad
				chofer: unChofer
				tipo: unTipo).
	^ true"
]

{ #category : #accessing }
Administrador >> agregarInsumo: unInsumo [

(insumos anySatisfy: [ :supply | ( supply nombre = unInsumo nombre ) & (supply marca = unInsumo marca)])
		ifFalse:[ insumos add: unInsumo.
					 ^true ].
		^false
]

{ #category : #accessing }
Administrador >> agregarLugar: unLugar [
	(lugares anySatisfy: [ :lugar | (lugar provincia = unLugar provincia) & (lugar localidad = unLugar localidad) ])
		ifFalse:[ lugares add: unLugar.
					 ^ true ] .
		^false
	
]

{ #category : #'as yet unclassified' }
Administrador >> agregarProvincia: unaProvincia localidad: unaLocalidad [
	| unLugar |
	unLugar := Lugar initializeCon: unaProvincia localidad: unaLocalidad.
	lugares add: unLugar.
	^unLugar
]

{ #category : #accessing }
Administrador >> agregarRuta: unaRuta [
	(rutas anySatisfy: [ :rute | rute == unaRuta ])
		ifFalse:[ rutas add: unaRuta.
					 ^ true ] .
		^false
]

{ #category : #'as yet unclassified' }
Administrador >> agregarRuta: unOrigen destino: unDestino combi: unaCombi distancia: unaDistancia horario: unHorario [
	"Chequea que la ruta no exista, en dicho caso agrega la ruta a la coleccion de rutas y devuelve un booleano confirmando o denegando la accion"

	| origenObj destinoObj unaRuta  |
	origenObj := self buscarLugar: unOrigen.
	destinoObj := self  buscarLugar: unDestino .
	unaRuta := Ruta
		newCon: origenObj
		destino: destinoObj
		combi: (self buscarCombi: unaCombi)
		distancia: unaDistancia
		horario: unHorario.
	(self existeRuta: unaRuta)
		ifTrue: [ ^ false ]
		ifFalse: [ rutas add: unaRuta.
			^ true ]
]

{ #category : #accessing }
Administrador >> agregarViaje: unViaje [
	viajes add: unViaje.
	(unViaje ruta combi chofer ) agregarViaje: unViaje.
]

{ #category : #'as yet unclassified' }
Administrador >> buscarCombi: unaCombiString [
	^ combis detect: [ :unaCombi | unaCombi string = unaCombiString ]
]

{ #category : #queries }
Administrador >> buscarInsumoConString: insumoSelected [
	^ insumos detect:[ :insumo | insumo string = insumoSelected ]
]

{ #category : #'as yet unclassified' }
Administrador >> buscarLugar: unLugarString [
	"Le llega el string de un lugar, y obtiene el objeto lugar"

	^ lugares detect: [ :lugar | lugar string = unLugarString string ]
]

{ #category : #'as yet unclassified' }
Administrador >> buscarRuta: unaRutaString [
	"Recibe el string de la ruta y obtiene el objeto ruta"

	^ rutas
		detect: [ :unaRuta | unaRuta string = unaRutaString ]
		ifNone: [  false ]
]

{ #category : #'as yet unclassified' }
Administrador >> buscarViajeDesde: unOrigen hasta: unDestino conFecha: unaFecha [
	^ viajes
		detect:
			[ :unViaje | unViaje origen: unOrigen destino: unDestino fecha: unaFecha ]
		ifNone: [  nil ]
]

{ #category : #accessing }
Administrador >> buscarViajesIdenticosA: unViaje [
	^ viajes
		select: [ :viaje | viaje origen:(unViaje ruta origen) destino:(unViaje ruta destino) fecha:(unViaje fecha) ]
]

{ #category : #'as yet unclassified' }
Administrador >> cancelarViaje: unViaje [
	| clientes |
	clientes := unViaje clientes.
	self enviarAdvertencia: clientes viaje: unViaje.
	self eliminar: unViaje de: clientes .
	unViaje estado: 'Cancelado'
]

{ #category : #accessing }
Administrador >> combis [
	^combis
]

{ #category : #accessing }
Administrador >> combisNombres [
	^ combis collect: [ :combi | combi string ]
]

{ #category : #'as yet unclassified' }
Administrador >> editarInsumo: unInsumo nombre: unNombre marca: unaMarca precio: unPrecio [
	|insumoNew|
	insumoNew := Insumo newNombre:unNombre marca:unaMarca  precio: unPrecio.
	(insumos anySatisfy: [ :insumo | insumo = insumoNew ])
		ifTrue: [ ^ false ]
		ifFalse: [  unInsumo editarNombre: unNombre marca: unaMarca precio: unPrecio.
			^ true]
]

{ #category : #'as yet unclassified' }
Administrador >> editarRuta: unaRuta origen: unOrigen destino: unDestino combi: unaCombi distancia: unaDistancia horario: unHorario [
	"Chequea que la ruta no tenga un viaje pendiente, en dicho caso edita la ruta  y devuelve un booleanos confirmando o denegando la accion."

	| origenObj destinoObj |
	origenObj := self buscarLugar: unOrigen.
	destinoObj := self buscarLugar: unDestino.
	(viajes anySatisfy: [ :unViaje | unViaje ruta = unaRuta ])
		ifTrue: [ ^ 'la ruta Asociada a un viaje' ]
		ifFalse: [ (self
				existeRuta: unaRuta
				Origen: origenObj
				destino: destinoObj
				combi: (self buscarCombi: unaCombi)
				distancia: unaDistancia
				horario: unHorario)
				ifTrue: [ ^ 'Existe la ruta que desea crear' ];
				ifFalse: [ unaRuta
							editarOrigen: origenObj
							destino: destinoObj
							combi: (self buscarCombi: unaCombi)
							distancia: unaDistancia
							horario: unHorario.
						^ true ] ]
]

{ #category : #'as yet unclassified' }
Administrador >> editarViaje: aTravel conRuta: unaRuta fecha: unaFecha precio: unPrecio asientos: unaCantidad [
	"Crea un viaje, si viajes no es una coleccion vacia y el nuevo viaje no existe en el sistema lo agrega"

	| unViaje |
	"Los datos nuevos recibidos por parametro"
	unViaje := Viaje
		newCon: unaRuta
		fecha: unaFecha
		precio: unPrecio
		asientos: unaCantidad.
	(viajes anySatisfy: [ :viaje | viaje = unViaje ])
		ifTrue: [ ^ false ]
		ifFalse: [ aTravel
				modificarDatosConRuta: unaRuta
				fecha: unaFecha
				precio: unPrecio
				asientos: unaCantidad.
			^ true ]
]

{ #category : #'as yet unclassified' }
Administrador >> eliminar: unViaje de: unosClientes [
	unosClientes do: [ :unCliente | unCliente eliminarElViaje: unViaje ]
]

{ #category : #'as yet unclassified' }
Administrador >> eliminarCombi: unaCombi [
	"Elimna una combi si no pertenece a ningun viaje y no pertenece a ninguna ruta, y devuelve un booleano confirmando o negando la accion"

	"((viajes anySatisfy: [ :unViaje | unViaje tiene: unaCombi ])
		and:"

	(rutas anySatisfy: [ :unaRuta | unaRuta tiene: unaCombi ])
		ifTrue: [ ^ false ]
		ifFalse: [ combis remove: unaCombi.
			unaCombi chofer estaDesocupado.
			^ true ]
]

{ #category : #'as yet unclassified' }
Administrador >> eliminarInsumo: unInsumo [
"Chequea que los insumos exista en la coleccion, de ser asi lo elimina. Devuelve un booleano confirmando y denegando la accion."
	(insumos anySatisfy: [ :insumo | insumo = unInsumo ])
		ifTrue: [  insumos remove: unInsumo.^ true ]
		ifFalse: [ ^ false.
			]
]

{ #category : #accessing }
Administrador >> eliminarLugar: unLugar [
	(rutas
		anySatisfy: [ :unaRuta | unaRuta seAsociaCon: unLugar ])
		ifTrue: [ ^ false ]
		ifFalse: [ lugares remove: unLugar.
			^ true ]
]

{ #category : #'as yet unclassified' }
Administrador >> eliminarRuta: unaRuta [
	"Chequea que la ruta no tenga viajes pendientes, en ese caso elimna la ruta de la coleccion de rutas y devuelve un booleano confirmando o negando la accion"

	viajes
		ifNotNil: [ (viajes anySatisfy: [ :unViaje | unViaje ruta = unaRuta ])
				ifTrue: [ ^ false ]
				ifFalse: [ rutas remove: unaRuta.
					^ true ].
			^ true ]
]

{ #category : #'as yet unclassified' }
Administrador >> eliminarViaje: aViaje [
	| clientes |
	aViaje estaPendiente
		ifTrue: [ clientes := aViaje clientes.
			viajes remove: aViaje.
			clientes
				ifNil: [ ^ 'No habia pasajeros para este viaje' ]
				ifNotNil: [ self enviarAdvertencia: clientes viaje: aViaje.
					self eliminar: aViaje de: clientes.
					self eliminarViajeChofer: aViaje.
					^ 'Se les devolvio el pago a los clientes correctamente' ] ]
		ifFalse: [ ^ nil ]
]

{ #category : #'as yet unclassified' }
Administrador >> eliminarViajeChofer: aViaje [
	(aViaje ruta combi chofer ) elimina: aViaje
]

{ #category : #'as yet unclassified' }
Administrador >> enviarAdvertencia: unosClientes viaje: unViaje [
	| advertencia |
	advertencia := GenericAdvertiseView
		newWithParent: self
		heading: 'Se le cancelo un Viaje  '
		item1: 'El viaje desde ' , unViaje ruta origen string , '  hasta  ', unViaje ruta destino string
		item2: 'Se te a devuelto el 100% del pasaje'
		item3: nil.
	unosClientes ifNotNil: [ unosClientes  do: [ :unCliente | unCliente eliminado: advertencia ]]
]

{ #category : #'as yet unclassified' }
Administrador >> existeCombi: unaPatente [
	unaPatente
		ifEmpty: [ ^ false ]
		ifNotEmpty: [ ^ (combis anySatisfy:  [ :unaCombi | unaCombi patente = unaPatente ])
				]
]

{ #category : #queries }
Administrador >> existeLugar: lugar [


	^ lugares
		anySatisfy:
			[ :place | place = lugar ]
				
]

{ #category : #'as yet unclassified' }
Administrador >> existeRuta: unaRuta [
	^ self rutas anySatisfy: [ :laRuta | laRuta = unaRuta ]
]

{ #category : #'as yet unclassified' }
Administrador >> existeRuta: unaRuta Origen: unOrigen destino: unDestino combi: unaCombi distancia: unaDistancia horario: unHorario [
	| dis rutaPrueba |
	unaDistancia
		ifEmpty: [ dis := unaRuta distancia ]
		ifNotEmpty: [ dis := unaDistancia ].
	rutaPrueba := Ruta
		newCon: unOrigen
		destino: unDestino
		combi: unaCombi
		distancia: dis
		horario: unHorario.
	^ self existeRuta: rutaPrueba
]

{ #category : #'as yet unclassified' }
Administrador >> existeViajeConRuta: unaRuta [
	^viajes anySatisfy: [ :unViaje | unViaje ruta = unaRuta ] 
]

{ #category : #'as yet unclassified' }
Administrador >> hayCombiConChofer: unChofer [
	^( combis anySatisfy: [ :unaCombi | unaCombi chofer = unChofer ])
]

{ #category : #initialization }
Administrador >> initializeCon: unNombre apellido: unApellido mail: unEmail contraseña: unaContraseña [
	nombre := unNombre.
	apellido := unApellido.
	email := unEmail.
	contraseña := unaContraseña.
	lugares := OrderedCollection new.
	insumos := OrderedCollection new.
	combis := OrderedCollection new.
	rutas := OrderedCollection new.
	viajes := OrderedCollection new.
]

{ #category : #accessing }
Administrador >> insumos [
	^insumos
]

{ #category : #queries }
Administrador >> insumosString [
	^ insumos collect: [ :insumo | insumo string ]
]

{ #category : #accessing }
Administrador >> lugares [ 
 ^lugares
]

{ #category : #accessing }
Administrador >> lugaresNombres [
	^ lugares collect: [ :lugar | lugar string ]
]

{ #category : #'as yet unclassified' }
Administrador >> perteneceAunaRuta: unLugar [
	^ rutas anySatisfy: [ :unaRuta | unaRuta seAsociaCon: unLugar ]
]

{ #category : #accessing }
Administrador >> rutas [
	^rutas
]

{ #category : #accessing }
Administrador >> rutasNombre [
	^ rutas collect: [  :ruta | ruta string ]
]

{ #category : #'as yet unclassified' }
Administrador >> validarViajeRuta: unaRuta fecha: unaFecha precio: unPrecio asientos: unaCantidadDeAsientos [
	"Crea un viaje y lo agrega a la coleccion de viajes "

	| unViaje asientosAux |
	asientosAux := unaCantidadDeAsientos.	"Parche ya que si la cantidad de asientos quedaba vacia, daba error."
	unaCantidadDeAsientos
		ifEmpty: [ asientosAux := unaRuta combi cantidadAsientos ].
	unViaje := Viaje
		newCon: unaRuta
		fecha: unaFecha
		precio: unPrecio
		asientos: asientosAux.
	asientosAux asInteger <= unaRuta combi cantidadAsientos
		ifTrue: [  
			viajes
				ifNil: [ viajes add: unViaje. unViaje ruta combi chofer agregarViaje: unViaje  ]
				ifNotNil: [ (viajes anySatisfy: [ :viaje | viaje = unViaje ])
						ifTrue: [ ^ 'El viaje ya existe en el sistema' ]
						ifFalse: [ viajes add: unViaje.unViaje ruta combi chofer agregarViaje: unViaje .
							^ nil ] ] ]
		ifFalse:
			[ ^ 'La cantidad de asientos ingresadas es mayor a la capacidad de la combi' ]
]
