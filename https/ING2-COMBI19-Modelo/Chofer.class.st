Class {
	#name : #Chofer,
	#superclass : #User,
	#instVars : [
		'telefono',
		'ocupado'
	],
	#category : #'ING2-COMBI19-Modelo'
}

{ #category : #initialization }
Chofer class >> initializeCon: unNombre apellido: unApellido email: unEmail contraseña: unaContraseña telefono: unTelefono [ 
	^ self initializeCon: unNombre apellido: unApellido email: unEmail contraseña: unaContraseña telefono: unTelefono 
]

{ #category : #comparing }
Chofer >> = unChofer [
	 ^ (self email = unChofer email) & (self nombre = unChofer nombre)
]

{ #category : #accessing }
Chofer >> editarDatosEmail: unEmail contraseña: unaContraseña telefono: unTelefono [
	email := unEmail.
	contraseña := unaContraseña.
	telefono := unTelefono
]

{ #category : #'as yet unclassified' }
Chofer >> estaDesocupado [
	ocupado := false.
]

{ #category : #'as yet unclassified' }
Chofer >> estaOcupado [
	ocupado := true.
]

{ #category : #initialization }
Chofer >> initializeCon: unNombre apellido: unApellido email: unEmail contraseña: unaContraseña telefono: unTelefono [
	nombre := unNombre.
	email := unEmail.
	apellido := unApellido.
	contraseña := unaContraseña.
	telefono := unTelefono.
	ocupado := false.
	viajes := OrderedCollection new
]

{ #category : #'as yet unclassified' }
Chofer >> ocupado [
	^ocupado
]
