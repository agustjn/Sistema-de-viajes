Class {
	#name : #Combi19,
	#superclass : #Object,
	#instVars : [
		'clientes',
		'choferes',
		'administrador'
	],
	#category : #'ING2-COMBI19-Modelo'
}

{ #category : #accessing }
Combi19 >> choferes [
	^choferes
]

{ #category : #accessing }
Combi19 >> clientes [
	 ^clientes
]

{ #category : #'accessing - backend' }
Combi19 >> crearAdmin: unNombre apellido: unApellido mail: unEmail contraseña: unaContraseña [
	administrador := Administrador
		initializeCon: unNombre
		apellido: unApellido
		mail: unEmail
		contraseña: unaContraseña.
	^ administrador
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
Combi19 >> eliminarChofer: unChofer [
	"Si el usuario no esta ocupado y no tiene una combi asignada se elimina y devuelve true, caso contrario no hace nada y devuelve false."

	unChofer ocupado
		&	(administrador hayCombiConChofer: unChofer)
		
		ifFalse: [ choferes remove: unChofer.
			^ true ].
	^ false
]

{ #category : #initialization }
Combi19 >> initialize [
	clientes := OrderedCollection new.
	choferes := OrderedCollection new.

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
