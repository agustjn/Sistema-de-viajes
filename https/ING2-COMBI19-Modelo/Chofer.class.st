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
	|instance|
	instance := self new.
	instance 
		initializeCon: unNombre
		apellido: unApellido
		email: unEmail
		contraseña: unaContraseña
		telefono: unTelefono.
	^instance.
]

{ #category : #accessing }
Chofer >> editarDatosEmail: unEmail contraseña: unaContraseña telefono: unTelefono nombre: aName apellido: aLastname [
	"Desde el componente EditorChoferView se envia el formulario.
	 Los campos que estan vacios no contengan vacio ('') , se modificaran"
	(unEmail = '')
		ifFalse:[ email := unEmail ].
	(unaContraseña = '')
		ifFalse:[ contraseña :=unaContraseña ].
	(unTelefono = '')
		ifFalse:[ telefono :=unTelefono ].
		(aName = '')
		ifFalse:[ nombre :=aName ].
		(aLastname = '')
		ifFalse:[ apellido :=aLastname ].
	 
]

{ #category : #'as yet unclassified' }
Chofer >> estaDesocupado [
	ocupado := false.
]

{ #category : #'as yet unclassified' }
Chofer >> estaOcupado [
	ocupado := true.
]

{ #category : #accessing }
Chofer >> estado [
	^ ocupado 
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

{ #category : #accessing }
Chofer >> ocupado: anObject [
	ocupado := anObject
]

{ #category : #accessing }
Chofer >> telefono [
	^ telefono
]

{ #category : #accessing }
Chofer >> telefono: anObject [
	telefono := anObject
]
