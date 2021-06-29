Class {
	#name : #Cliente,
	#superclass : #User,
	#instVars : [
		'telefono',
		'fechaNac',
		'dni',
		'plan',
		'tarjeta'
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

{ #category : #accessing }
Cliente >> agregarTarjeta: aCreditCard [
	tarjeta := aCreditCard 
]

{ #category : #accessing }
Cliente >> agregarViaje: unViaje insumo: unosInsumos tarjeta: unaTarjeta cantidadButacas: unaCantidad [
	|laTarjeta|
	laTarjeta := unaTarjeta .
	(viajes anySatisfy: [ :algunViaje | algunViaje fecha = unViaje fecha ])
	ifTrue: [ ^ 'Ya posee un viaje en esta fecha' ];
	ifFalse: [ laTarjeta  ifNil: [(self soyGold)  ifTrue: [ laTarjeta := (self tarjeta) ]; ifFalse: [ "Debe ingresar una tarjeta " ]].
		 			unViaje agregarCliente: self insumos: unosInsumos cantidadButacas: unaCantidad ].
				
]

{ #category : #accessing }
Cliente >> dni [
	^dni
]

{ #category : #accessing }
Cliente >> dni: anObject [
	dni := anObject
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
	viajes := OrderedCollection new
]

{ #category : #modifying }
Cliente >> modificarConMail: correo Nombre: name Apellido: lastname Dni: documento Contraseña: password FechaNacimiento: fechaNacimiento [
	(correo = '')
		ifFalse:[  
						(self validarMail: correo) ifFalse:[ ^ 'errorEnMail' ] ].
	(name = '')
		ifFalse:[ nombre := name ].
	(lastname = '')
		ifFalse:[ apellido := lastname ].
	documento = ''
		ifFalse:[ dni := documento ].
	"Falta validar contraseña y fecha de nacimiento"	
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
Cliente >> validarMail: unEmail [
	 (Combi19 soleInstance existeMail: unEmail)
		 ifTrue:[ ^ 'errorEnMail' ].
	 ^ true
		
		
]
