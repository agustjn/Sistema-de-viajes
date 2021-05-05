Class {
	#name : #Cliente,
	#superclass : #User,
	#instVars : [
		'telefono',
		'fechaNac',
		'dni',
		'plan'
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
Cliente >> dni [
	^dni
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
Cliente >> telefono [
	^telefono
]
