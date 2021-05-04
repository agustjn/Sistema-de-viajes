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
	viajes add: unViaje
]

{ #category : #accessing }
User >> apellido [ 	
	^apellido
]

{ #category : #accessing }
User >> contraseña [ 
	^contraseña 
]

{ #category : #accessing }
User >> email [
	^email
]

{ #category : #accessing }
User >> nombre [ 
	^nombre
]

{ #category : #accessing }
User >> viajes [
	^viajes
]
