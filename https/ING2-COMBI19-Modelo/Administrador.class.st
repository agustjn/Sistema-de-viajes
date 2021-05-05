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
Administrador class >> initializeCon: unNombre apellido: unApellido  mail: unEmail contraseña: unaContraseña [ 
	^ self initializeCon: unNombre apellido: unApellido  mail: unEmail contraseña: unaContraseña 
]

{ #category : #'as yet unclassified' }
Administrador >> agregarCombiModelo: unModelo patente: unaPatente cantidadAsientos: unaCantidad chofer: unChofer tipo: unTipo [
	"Chequea que no exista una combi con una patente igual, si no existe, crea la combi la agrega a la coleccion y devuelve un booleano confirmando."

	(combis anySatisfy: [ :unaCombi | unaCombi patente = unaPatente ])
		ifTrue: [ ^ false ];
		ifFalse: [ combis
					add:
						(Combi
							initializModelo: unModelo
							patente: unaPatente
							asientos: unaCantidad
							chofer: unChofer
							tipo: unTipo).
				^ true ]
]

{ #category : #accessing }
Administrador >> agregarInsumo: unNombre tipo: unTipo precio: unPrecio [
	"Si el nombre y el tipo de insumo no existe lo crea y agrega a la coleccion de insumos
"
	|unInsumo|
	unInsumo := Insumo initializeCon: unNombre tipo:  unTipo  precio:  unPrecio.
	(insumos anySatisfy: [ :insumo | insumo = unInsumo ]) ifTrue: [ ^false ] ifFalse: [ insumos add: unInsumo. ^ true ] 

	
]

{ #category : #'as yet unclassified' }
Administrador >> agregarProvincia: unaProvincia localidad: unaLocalidad [
	| unLugar |
	unLugar := Lugar initializeCon: unaProvincia localidad: unaLocalidad.
	lugares add: unLugar.
	^unLugar
]

{ #category : #'as yet unclassified' }
Administrador >> agregarRuta: unOrigen destino: unDestino horario: unaHora combi: unaCombi distancia: unaDistancia [
	"Chequea que la ruta no exista, en dicho caso agrega la ruta a la coleccion de rutas y devuelve un booleano confirmando o denegando la accion"

	| unaRuta |
	unaRuta := Ruta
		initializeCon: unOrigen
		destino: unDestino
		horario: unaHora
		combi: unaCombi
		distancia: unaDistancia.
	(rutas anySatisfy: [ :ruta | ruta = unaRuta ])
		ifTrue: [ ^ false ]
		ifFalse: [ rutas add: unaRuta.
			^ true ]
]

{ #category : #'as yet unclassified' }
Administrador >> agregarViajeCon: unChofer ruta: unaRuta combi: unaCombi fecha: unaFecha hora: unaHora precio: unPrecio [
	"Crea un viaje y lo agrega a la coleccion de viajes "

	| unViaje |
	unViaje := Viaje
		initializeCon: unaRuta
		combi: unaCombi
		fecha: unaFecha
		hora: unaHora
		precio: unPrecio.
	viajes add: unViaje.
	^ unViaje
]

{ #category : #accessing }
Administrador >> combis [
	^combis
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
Administrador >> editarRuta: unaRuta origen: unOrigen destino: unDestino horario: unHorario combi: unaCombi distancia: unaDistancia [
"Chequea que la ruta no tenga un viaje pendiente, en dicho caso edita la ruta  y devuelve un booleanos confirmando o denegando la accion."
	(viajes anySatisfy: [ :unViaje | unViaje ruta = unaRuta ])
		ifTrue: [ ^ false ]
		ifFalse: [ unaRuta editarOrigen: unOrigen destino: unDestino horario: unHorario combi: unaCombi distancia: unaDistancia.
			^ true ]
]

{ #category : #'as yet unclassified' }
Administrador >> eliminarCombi: unaCombi [
	"Elimna una combi si no pertenece a ningun viaje y no pertenece a ninguna ruta, y devuelve un booleano confirmando o negando la accion"

	(viajes
		anySatisfy:
			[ :unViaje | unViaje tiene: unaCombi ]
				& (rutas anySatisfy: [ :unaRuta | unaRuta tiene: unaCombi ]))
		ifTrue: [ ^ false ]
		ifFalse: [ combis remove: unaCombi.
			^ true ]
]

{ #category : #'as yet unclassified' }
Administrador >> eliminarInsumo: unInsumo [
"Chequea que los insumos exista en la coleccion, de ser asi lo elimina. Devuelve un booleano confirmando y denegando la accion."
	(insumos anySatisfy: [ :insumo | insumo = unInsumo ])
		ifTrue: [ ^ false ]
		ifFalse: [ insumos remove: unInsumo.
			^ true ]
]

{ #category : #'as yet unclassified' }
Administrador >> eliminarRuta: unaRuta [
	"Chequea que la ruta no tenga viajes pendientes, en ese caso elimna la ruta de la coleccion de rutas y devuelve un booleano confirmando o negando la accion"

	(viajes anySatisfy: [ :unViaje | unViaje ruta = unaRuta ])
		ifTrue: [ ^ false ]
		ifFalse: [ rutas remove: unaRuta. ^ true ]
]

{ #category : #'as yet unclassified' }
Administrador >> hayCombiConChofer: unChofer [
	^( combis anySatisfy: [ :unaCombi | unaCombi chofer = unChofer ])
]

{ #category : #initialization }
Administrador >> initializeCon: unNombre apellido: unApellido  mail: unEmail contraseña: unaContraseña [ 
	nombre:= unNombre.
	apellido := unApellido.
	email := unEmail.
	contraseña := unaContraseña.
	
]

{ #category : #accessing }
Administrador >> insumos [
	^insumos
]

{ #category : #accessing }
Administrador >> lugares [ 
 ^lugares
]

{ #category : #accessing }
Administrador >> rutas [
	^rutas
]
