Class {
	#name : #Cliente,
	#superclass : #User,
	#instVars : [
		'telefono',
		'fechaNac',
		'dni',
		'plan',
		'tarjeta',
		'reservas',
		'advertencia'
	],
	#category : #'ING2-COMBI19-Modelo'
}

{ #category : #initialization }
Cliente class >> initializeCon: unEmail contraseña: unaContraseña nombre: unNombre apellido: unApellido dni: unDni fecha: unaFecha plan: unPlan [
	| instance |
	instance := self new.
	instance initializeCon: unEmail
			contraseña: unaContraseña
			nombre: unNombre
			apellido: unApellido
			dni: unDni
			fecha: unaFecha
			plan: unPlan.
		^instance
	
]

{ #category : #queries }
Cliente >> advertencia [ 
	^ advertencia
]

{ #category : #accessing }
Cliente >> agregarReserva: unaReserva [
	reservas add: unaReserva
]

{ #category : #accessing }
Cliente >> agregarTarjeta: aCreditCard [
	tarjeta := aCreditCard 
]

{ #category : #'as yet unclassified' }
Cliente >> buscarViajeFiltradoPor: unFiltro [
	^ viajes select:[ :unViaje | unViaje esta: unFiltro ]
]

{ #category : #accessing }
Cliente >> dni [
	^dni
]

{ #category : #accessing }
Cliente >> dni: anObject [
	dni := anObject
]

{ #category : #queries }
Cliente >> eliminado: unaAdvertencia [ 
	advertencia := unaAdvertencia
]

{ #category : #accessing }
Cliente >> fechaNac: anObject [
	fechaNac := anObject
]

{ #category : #initialization }
Cliente >> initializeCon: unEmail contraseña: unaContraseña nombre: unNombre apellido: unApellido dni: unDni fecha: unaFecha plan: unPlan [
	email := unEmail.
	contraseña := unaContraseña.
	nombre := unNombre.
	apellido := unApellido.
	dni := unDni.
	fechaNac := unaFecha.
	plan := unPlan.
	tarjeta:= nil.
	viajes := OrderedCollection new.
	reservas := OrderedCollection new.
]

{ #category : #modifying }
Cliente >> modificarConMail: correo Nombre: name Apellido: lastname Dni: documento Contraseña: password FechaNacimiento: fechaNacimiento [
 correo ifNotEmpty:[ (self validarMail: correo) ifFalse:[ ^ 'errorEnMail' ] ].
 password ifNotEmpty: [(self validarContraseña: password) ifFalse:[ ^ 'errorEnContraseña' ] ].
 (fechaNacimiento asString) ifNotEmpty:[(self validarFechaDeNacimiento: fechaNacimiento) ifFalse:[ ^ 'errorEnFechaNacimiento' ] ].
 "Si no hubo ningun error en las validaciones, se procede a verificar los campos vacios y no vacios"
	name isEmpty
		ifFalse:[ nombre := name ].
	lastname isEmpty
		ifFalse:[ apellido := lastname ].
	documento isEmpty
		ifFalse:[ dni := documento ].
	correo isEmpty
		ifFalse:[ email := correo ].
	password isEmpty
		ifFalse:[ contraseña := password ].
	(fechaNacimiento asString) isEmpty
		ifFalse:[ fechaNac := fechaNacimiento ].
	

	
]

{ #category : #accessing }
Cliente >> nacimiento [
	^ fechaNac 
]

{ #category : #accessing }
Cliente >> plan [
	^plan
]

{ #category : #accessing }
Cliente >> plan: anObject [
	plan := anObject
]

{ #category : #queries }
Cliente >> renderizarEliminado [
	advertencia := nil.
]

{ #category : #queries }
Cliente >> seRepiteViajeConFecha: unaFecha [
	^ (self viajesPendientes) anySatisfy: [ :viaje | viaje fecha = unaFecha ]
]

{ #category : #accessing }
Cliente >> soyGold [
	^ (plan tipo = 'Gold') 
]

{ #category : #accessing }
Cliente >> tarjeta [
	^tarjeta
]

{ #category : #accessing }
Cliente >> telefono [
	^telefono
]

{ #category : #accessing }
Cliente >> telefono: anObject [
	telefono := anObject
]

{ #category : #queries }
Cliente >> validarContraseña: password [ 
	^ password size > 5
		
	
]

{ #category : #queries }
Cliente >> validarFechaDeNacimiento: fechaNacimiento [
	^ (Date today subtractDate: fechaNacimiento asDate) > 6570
]

{ #category : #queries }
Cliente >> validarMail: unEmail [
	 ^ (Combi19 soleInstance existeMail: unEmail)

		
		
]

{ #category : #queries }
Cliente >> viajesPendientes [
	^ viajes select: [ :viaje | viaje esta: 'Pendiente' ]
]
