Class {
	#name : #User,
	#superclass : #Object,
	#instVars : [
		'nombre',
		'apellido',
		'email',
		'contraseña',
		'viajes'
	],
	#category : #'ING2-COMBI19-Modelo'
}

{ #category : #accessing }
User >> agregarViaje: unViaje [
	self halt.
	viajes add: unViaje
]

{ #category : #accessing }
User >> apellido [ 	
	^apellido
]

{ #category : #accessing }
User >> apellido: anObject [
	apellido := anObject
]

{ #category : #accessing }
User >> contraseña [ 
	^contraseña 
]

{ #category : #accessing }
User >> contraseña: anObject [
	contraseña := anObject
]

{ #category : #accessing }
User >> email [
	^email
]

{ #category : #accessing }
User >> email: anObject [
	email := anObject
]

{ #category : #accessing }
User >> nombre [ 
	^nombre
]

{ #category : #accessing }
User >> nombre: anObject [
	nombre := anObject
]

{ #category : #accessing }
User >> string [
	^ self nombre, ' ', self apellido
]

{ #category : #accessing }
User >> viajes [
	^ viajes sort: [ :a :b | a fecha < b fecha ]
]

{ #category : #accessing }
User >> viajes: anObject [
	viajes := anObject
]
