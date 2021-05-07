Class {
	#name : #Lugar,
	#superclass : #Object,
	#instVars : [
		'provincia',
		'localidad'
	],
	#category : #'ING2-COMBI19-Modelo'
}

{ #category : #initialization }
Lugar class >> deProvincia: unaProvincia yLocalidad: unaLocalidad [
	| instance |
	instance := self new.
	instance provincia: unaProvincia.
	instance localidad: unaLocalidad.
	^ instance
]

{ #category : #initialization }
Lugar >> localidad [ 
	^localidad
]

{ #category : #accessing }
Lugar >> localidad: anObject [
	localidad := anObject
]

{ #category : #initialization }
Lugar >> provincia [ 
	^ provincia
]

{ #category : #accessing }
Lugar >> provincia: anObject [
	provincia := anObject
]
