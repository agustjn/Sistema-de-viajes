Class {
	#name : #Cliente,
	#superclass : #User,
	#instVars : [
		'telefono',
		'fechaNac',
		'dni',
		'plan',
		'tarjetas'
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
	tarjetas add: aCreditCard
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
Cliente >> initializeCon: unEmail contraseña: unaContraseña  nombre: unNombre apellido: unApellido dni: unDni  fecha: unaFecha plan: unPlan [
	email := unEmail.
	contraseña  := unaContraseña.
	nombre := unNombre .
	apellido := unApellido.
	dni := unDni .
	fechaNac := unaFecha.
	plan := unPlan.
	viajes := OrderedCollection new.
	tarjetas := OrderedCollection new.
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
Cliente >> telefono [
	^telefono
]

{ #category : #accessing }
Cliente >> telefono: anObject [
	telefono := anObject
]
