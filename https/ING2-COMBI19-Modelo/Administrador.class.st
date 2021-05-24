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
Administrador >> agregarRuta: unOrigen destino: unDestino combi: unaCombi distancia: unaDistancia [
	"Chequea que la ruta no exista, en dicho caso agrega la ruta a la coleccion de rutas y devuelve un booleano confirmando o denegando la accion"

	| unaRuta |
	unaRuta := Ruta
		newCon: unOrigen
		destino: unDestino
		combi: unaCombi
		distancia: unaDistancia.
	(self
		existeRuta: unaRuta)
		ifTrue: [ ^ false ]
		ifFalse: [ rutas add: unaRuta.
			^ true ]
]

{ #category : #'as yet unclassified' }
Administrador >> agregarRuta: unOrigen destino: unDestino combi: unaCombi distancia: unaDistancia horario:unHorario [
	"Chequea que la ruta no exista, en dicho caso agrega la ruta a la coleccion de rutas y devuelve un booleano confirmando o denegando la accion"

	| unaRuta |
	unaRuta := Ruta
		newCon: unOrigen
		destino: unDestino
		combi: unaCombi
		distancia: unaDistancia
		horario:unHorario.
	(self
		existeRuta: unaRuta)
		ifTrue: [ ^ false ]
		ifFalse: [ rutas add: unaRuta.
			^ true ]
]

{ #category : #'as yet unclassified' }
Administrador >> agregarViajeConRuta: unaRuta fecha: unaFecha hora: unaHora precio: unPrecio [
	"Crea un viaje y lo agrega a la coleccion de viajes "

	| unViaje |
	unViaje := Viaje
		newCon: unaRuta
		fecha: unaFecha
		precio: unPrecio.
	viajes
		ifNotNil: [ (viajes anySatisfy: [ :viaje | viaje = unViaje  ])
				ifTrue: [ ^ false ]
				ifFalse: [ 
					viajes add: unViaje.
					^ true ] ].
	viajes add: unViaje
]

{ #category : #'as yet unclassified' }
Administrador >> buscarCombi: unaCombiString [
	^ combis detect: [ :unaCombi | unaCombi string = unaCombiString ]
]

{ #category : #'as yet unclassified' }
Administrador >> buscarLugar: unLugarString [
	"Le llega el string de un lugar, y obtiene el objeto lugar"

	^ lugares detect: [ :lugar | lugar string = unLugarString ]
]

{ #category : #'as yet unclassified' }
Administrador >> buscarRuta: unaRutaString [
"Recibe el string de la ruta y obtiene el objeto ruta"
	^ rutas detect: [ :unaRuta | unaRuta string = unaRutaString ]
			ifNone:[ ^false ]
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
Administrador >> editarCombi: unaCombi modelo: unModelo cantidadAsientos: unaCantidad tipo: unTipo patente: unaPatente [
"Chequea que no exista una Combi con una patente igual a la que llega por parametrO, en caso de no existir edita la combi . Devuelve un booleano confirmando o denegando la accion"
	(combis anySatisfy: [ :combi | combi patente = unaPatente ])
		ifTrue: [ ^ false ]
		ifFalse: [ unaCombi
				editarModelo: unModelo
				cantidadAsientos: unaCantidad
				tipo: unTipo
				patente: unaPatente.
			^ true ]
]

{ #category : #'as yet unclassified' }
Administrador >> editarInsumo: unInsumo nombre: unNombre tipo: unTipo precio: unPrecio [
	(insumos anySatisfy: [ :insumo | insumo = unInsumo ])
		ifTrue: [ ^ false ]
		ifFalse: [ unInsumo editarNombre: unNombre tipo: unTipo precio: unPrecio. ^true]
]

{ #category : #'as yet unclassified' }
Administrador >> editarRuta: unaRuta origen: unOrigen destino: unDestino combi: unaCombi distancia: unaDistancia [
	"Chequea que la ruta no tenga un viaje pendiente, en dicho caso edita la ruta  y devuelve un booleanos confirmando o denegando la accion."

	((viajes anySatisfy: [ :unViaje | unViaje ruta = unaRuta ])
		| (self existeRuta: unaRuta))
		ifTrue: [ ^ false ]
		ifFalse: [ unaRuta
				editarOrigen: unOrigen
				destino: unDestino
				combi: unaCombi
				distancia: unaDistancia.
			^ true ]
]

{ #category : #'as yet unclassified' }
Administrador >> editarViaje: aTravel conRuta: unaRuta fecha: unaFecha hora: unaHora precio: unPrecio [
"Crea un viaje, si viajes no es una coleccion vacia y el nuevo viaje no existe en el sistema lo agrega"
	| unViaje | "Los datos nuevos recibidos por parametro"
	unViaje := Viaje
		newCon: unaRuta
		fecha: unaFecha
		precio: unPrecio.
	(viajes anySatisfy: [ :viaje | viaje = unViaje ])
				ifTrue: [ ^ false ]
				ifFalse: [ aTravel modificarDatosConRuta: unaRuta fecha: unaFecha precio: unPrecio.
					^ true ] 
]

{ #category : #deprecated }
Administrador >> editarViajeConRuta: unaRuta fecha: unaFecha hora: unaHora precio: unPrecio [
"Crea un viaje, si viajes no es una coleccion vacia y el nuevo viaje no existe en el sistema lo agrega"
	| unViaje |
	unViaje := Viaje
		initializeCon: unaRuta
		fecha: unaFecha
		precio: unPrecio.
	viajes
		ifNotNil: [ (viajes anySatisfy: [ :viaje | viaje = unViaje ])
				ifTrue: [ ^ false ]
				ifFalse: [ viajes add: unViaje.
					^ true ] ]
]

{ #category : #'as yet unclassified' }
Administrador >> eliminarCombi: unaCombi [
	"Elimna una combi si no pertenece a ningun viaje y no pertenece a ninguna ruta, y devuelve un booleano confirmando o negando la accion"
   
	"((viajes anySatisfy: [ :unViaje | unViaje tiene: unaCombi ])
		and:" (rutas anySatisfy: [ :unaRuta | unaRuta tiene: unaCombi ])
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
"No chequea, hay que ver cual era la restriccion"
	viajes remove: aViaje
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
		anySatisfy: [ :place | 
			place esIgualA: lugar ]
]

{ #category : #'as yet unclassified' }
Administrador >> existeRuta: unaRuta [
	^ rutas anySatisfy: [ :laRuta | laRuta = unaRuta ]
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
Administrador >> lugarPerteneceAUnViaje: lugar [
	^ viajes anySatisfy:[ :viaje | (viaje ruta origen == lugar) | (viaje ruta destino == lugar)  ] 
	
]

{ #category : #accessing }
Administrador >> lugares [ 
 ^lugares
]

{ #category : #accessing }
Administrador >> lugaresNombres [
	^ lugares collect: [ :lugar | lugar string ]
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
Administrador >> validarViajeRuta: unaRuta fecha: unaFecha precio: unPrecio [
	"Crea un viaje y lo agrega a la coleccion de viajes "
	| unViaje |
	unViaje := Viaje
		newCon: unaRuta
		fecha: unaFecha
		precio: unPrecio.
	viajes
		ifNotNil: [ (viajes anySatisfy: [ :viaje | viaje = unViaje  ])
				ifTrue: [ ^ false ]
				ifFalse: [ 
					viajes add: unViaje.
					^ true ] ].
]

{ #category : #'as yet unclassified' }
Administrador >> validarViajeRuta: unaRuta fecha: unaFecha precio: unPrecio asientos: unaCantidadDeAsientos [
	"Crea un viaje y lo agrega a la coleccion de viajes "

	| unViaje |
	unViaje := Viaje newCon: unaRuta fecha: unaFecha precio: unPrecio asientos: unaCantidadDeAsientos .
	(unaCantidadDeAsientos asInteger < unaRuta combi cantidadDeAsientos)
	"Si la cantidad ingresada de asientos no supera la capacidad de la combi, entonces verifico si existe un viaje identico, sino retorno false"
		ifTrue: [ viajes
				ifNotNil: [ (viajes anySatisfy: [ :viaje | viaje = unViaje ])
						ifTrue: [ ^ false ]
						ifFalse: [ viajes add: unViaje.
							^ true ] ] ]
		ifFalse: [ ^ false ]
]
