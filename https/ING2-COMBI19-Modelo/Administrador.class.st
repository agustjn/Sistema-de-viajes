Class {
	#name : #Administrador,
	#superclass : #User,
	#category : #'ING2-COMBI19-Modelo'
}

{ #category : #initialization }
Administrador class >> initializeCon: unNombre apellido: unApellido  mail: unEmail contraseña: unaContraseña [ 
	^ self initializeCon: unNombre apellido: unApellido  mail: unEmail contraseña: unaContraseña 
]

{ #category : #initialization }
Administrador >> initializeCon: unNombre apellido: unApellido  mail: unEmail contraseña: unaContraseña [ 
	nombre:= unNombre.
	apellido := unApellido.
	email := unEmail.
	contraseña := unaContraseña.
	
]
