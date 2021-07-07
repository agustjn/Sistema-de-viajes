Class {
	#name : #ViajeClientSelector,
	#superclass : #Object,
	#instVars : [
		'viaje',
		'parent'
	],
	#category : #'ING2-COMBI19-UI-CLIENTE-Viajes-UI'
}

{ #category : #'instance creation' }
ViajeClientSelector class >> of: aViaje andParent: aParent [
	^ self new inicializeCon: aViaje parent: aParent
]
