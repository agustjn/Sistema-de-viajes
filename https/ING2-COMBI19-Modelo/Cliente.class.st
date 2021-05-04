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
Cliente class >> initializeCon: unEmail contraseña: unaContraseña  nombre: unNombre apellido: unApellido dni: unDni  fecha: unaFecha  plan: unPlan [
	^ self initializeCon: unEmail contraseña: unaContraseña  nombre: unNombre apellido: unApellido dni: unDni  fecha: unaFecha plan: unPlan.
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
