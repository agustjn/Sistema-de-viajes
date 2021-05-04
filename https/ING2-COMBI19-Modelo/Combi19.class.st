Class {
	#name : #Combi19,
	#superclass : #Object,
	#instVars : [
		'lugares',
		'clientes',
		'choferes',
		'administrador',
		'combis',
		'viajes',
		'rutas'
	],
	#category : #'ING2-COMBI19-Modelo'
}

{ #category : #'as yet unclassified' }
Combi19 >> agregarCombiModelo: unModelo patente: unaPatente cantidadAsientos: unaCantidad chofer: unChofer tipo: unTipo [
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

{ #category : #'as yet unclassified' }
Combi19 >> agregarViajeCon: unChofer ruta: unaRuta combi: unaCombi fecha: unaFecha hora: unaHora precio: unPrecio [
"Falta terminar, y metodos relacionados"
	| unViaje |
	unViaje := Viaje
		initializeCon: unaRuta
		combi: unaCombi
		fecha: unaFecha
		hora: unaHora
		precio: unPrecio
]

{ #category : #'as yet unclassified' }
Combi19 >> cargarProvincia: unaProvincia localidad: unaLocalidad [
	| unLugar |
	unLugar := Lugar initializeCon: unaProvincia localidad: unaLocalidad.
	lugares add: unLugar.
	^unLugar
]

{ #category : #accessing }
Combi19 >> choferes [
	^choferes
]

{ #category : #accessing }
Combi19 >> combis [
	^combis
]

{ #category : #'accessing - backend' }
Combi19 >> crearAdmin: unNombre apellido: unApellido  mail: unEmail contraseña: unaContraseña [ 
	administrador := Administrador initializeCon: unNombre apellido: unApellido  mail: unEmail contraseña: unaContraseña 
]

{ #category : #'accessing - backend' }
Combi19 >> crearChofer: unNombre apellido: unApellido email: unEmail contraseña: unaContraseña telefono: unTelefono [ 
	|unChofer|
	unChofer := Chofer initializeCon: unNombre apellido: unApellido email: unEmail contraseña: unaContraseña telefono: unTelefono.
	choferes add: unChofer.
	^ unChofer
]

{ #category : #'accessing - backend' }
Combi19 >> crearClienteBasico: unEmail contraseña: unaContraseña  nombre: unNombre apellido: unApellido dni: unDni  fecha: unaFecha [   
	|unCliente|
	unCliente := Cliente initializeCon: unEmail contraseña: unaContraseña  nombre: unNombre apellido: unApellido dni: unDni  fecha: unaFecha plan: (Basico new).
	clientes add: unCliente.
]

{ #category : #'accessing - backend' }
Combi19 >> crearClienteGold: unEmail contraseña: unaContraseña  nombre: unNombre apellido: unApellido dni: unDni  fecha: unaFecha [   
	|unCliente|
	unCliente := Cliente initializeCon: unEmail contraseña: unaContraseña  nombre: unNombre apellido: unApellido dni: unDni  fecha: unaFecha plan: (Gold new).
	clientes add: unCliente.
]

{ #category : #'as yet unclassified' }
Combi19 >> editarChofer: unChofer email: unEmail contraseña: unaContraseña telefono: unTelefono [ 
	"Chequea que el email que llega por parametro no lo tenga otro chofer asignado , edita , y devuelve un booleano confirmando o negando accion"

	(choferes anySatisfy: [ :chofer | chofer email = unEmail ])
		ifTrue: [ ^ false ]
		ifFalse: [ unChofer
				editarDatosEmail: unEmail
				contraseña: unaContraseña
				telefono: unTelefono.
			^ true ]
]

{ #category : #'as yet unclassified' }
Combi19 >> editarCombi: unaCombi modelo: unModelo cantidadAsientos: unaCantidad tipo: unTipo patente: unaPatente [
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
Combi19 >> eliminarChofer: unChofer [
"Si el usuario no esta ocupado y no tiene una combi asignada se elimina y devuelve true, caso contrario no hace nada y devuelve false."
	unChofer ocupado
		& (combis anySatisfy: [ :unaCombi | unaCombi chofer = unChofer ])
		ifFalse: [ choferes remove: unChofer.
			^ true ].
	^ false
]

{ #category : #'as yet unclassified' }
Combi19 >> eliminarCombi: unaCombi [
	"Elimna una combi si no pertenece a ningun viaje y no pertenece a ninguna ruta, y devuelve un booleano confirmando o negando la accion"

	(viajes
		anySatisfy:
			[ :unViaje | unViaje tiene: unaCombi ]
				& (rutas anySatisfy: [ :unaRuta | unaRuta tiene: unaCombi ]))
		ifTrue: [ ^ false ]
		ifFalse: [ combis remove: unaCombi.
			^ true ]
]

{ #category : #initialization }
Combi19 >> initialize [
	clientes := OrderedCollection new.
	choferes := OrderedCollection new.
	combis := OrderedCollection new.
	viajes := OrderedCollection new.
]

{ #category : #accessing }
Combi19 >> lugares [ 
 ^lugares
]

{ #category : #'accessing - backend' }
Combi19 >> usuario: unEmail protegidoPor: unaClave [
"Busca el usuario en las diferentes colecciones y en caso de exito lo devuelve, sino devuelve nil."
		|elUsuario |
		elUsuario := clientes detect: [ :unUsuario | unUsuario email = unEmail & (unUsuario contraseña = unaClave ) ].
		elUsuario ifNil: (choferes detect: [ :unUsuario | unUsuario email = unEmail & (unUsuario contraseña = unaClave ) ]).
		elUsuario ifNil:  (administrador email = unEmail & (administrador contraseña = unaClave) ).
		^ elUsuario 
		
]
