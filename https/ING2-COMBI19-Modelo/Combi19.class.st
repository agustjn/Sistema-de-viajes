Class {
	#name : #Combi19,
	#superclass : #Object,
	#instVars : [
		'clientes',
		'choferes',
		'administrador'
	],
	#classInstVars : [
		'soleInstance'
	],
	#category : #'ING2-COMBI19-Modelo'
}

{ #category : #accessing }
Combi19 class >> clearSoleInstance [
	soleInstance := nil.
]

{ #category : #'instance creation' }
Combi19 class >> instanciaDePrueba [
	self soleInstance.
	soleInstance
		crearAdmin: 'ING'
		apellido: 'SOFT 2'
		mail: 'admin'
		contraseña: 'admin'.
	soleInstance
		crearChofer: 'Esteban'
		apellido: 'Perez'
		email: 'esteban@hotmail.com'
		contraseña: '123456'
		telefono: '2218896545'.
	soleInstance
		crearChofer: 'Carlos'
		apellido: 'Mansilla'
		email: 'carlos@hotmail.com'
		contraseña: '1234567'
		telefono: '22215312'.
	soleInstance administrador
		agregarCombiModelo: 'Mercedes Benz Sprinter'
		patente: 'CGF-412'
		cantidadAsientos: 40
		chofer: soleInstance choferes first
		tipo: 'Media distancia'
]

{ #category : #accessing }
Combi19 class >> soleInstance [
	^ soleInstance ifNil: [ soleInstance := self new. ]
]

{ #category : #accessing }
Combi19 >> administrador [
	^ administrador
]

{ #category : #accessing }
Combi19 >> administrador: anObject [
	administrador := anObject
]

{ #category : #'as yet unclassified' }
Combi19 >> buscarAdminMail: unEmail pass: unaClave [
	administrador email = unEmail & (administrador contraseña = unaClave)
		ifTrue: [ ^ administrador ]
		ifFalse: [ ^ nil ]
]

{ #category : #'as yet unclassified' }
Combi19 >> buscarChoferMail: unEmail pass: unaClave [
		(clientes
		select:
			[ :unUsuario | unUsuario email = unEmail & (unUsuario contraseña = unaClave) ])
		ifEmpty: [ ^ nil ]
]

{ #category : #queries }
Combi19 >> buscarClienteMail: unEmail pass: unaClave [
	(clientes
		select:
			[ :unUsuario | unUsuario email = unEmail & (unUsuario contraseña = unaClave) ])
		ifEmpty: [ ^ nil ]
]

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
Combi19 >> crearClienteConMail: unEmail contraseña: unaContraseña nombre: unNombre apellido: unApellido dni: unDni fecha: unaFecha plan: unPlan [
	| unCliente |
	unCliente := Cliente
		initializeCon: unEmail
		contraseña: unaContraseña
		nombre: unNombre
		apellido: unApellido
		dni: unDni
		fecha: unaFecha
		plan: unPlan.
	clientes add: unCliente.
	^unCliente
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

{ #category : #queries }
Combi19 >> usuario: unEmail protegidoPor: unaClave [
	"Busca el usuario en las diferentes colecciones y en caso de exito lo devuelve, sino devuelve nil."

	| elUsuario |
	elUsuario := nil.
	elUsuario := (self buscarClienteMail: unEmail pass: unaClave)
		ifNil: [ (self buscarChoferMail: unEmail pass: unaClave)
				ifNil: (self buscarAdminMail: unEmail pass: unaClave) ].
	^ elUsuario
]

{ #category : #queries }
Combi19 >> validarRegistroConMail: mail Password: contraseña FechaNac: fechaNac [
	^ ( ((clientes anySatisfy: [ :client | client email = mail ]) not)
		and: contraseña size >= 6)
		and:
			[ "En la condicion de las fechas, el calculo que se realiza es el dia de hoy menos
		la fecha ingresada por el usuario. Ese calculo se retorna en dias, y 6570 son la cantidad
		de dias que hay en 18 años. Falta mejorarlo" (Date today subtractDate: fechaNac asDate) > 6570 ]
]
