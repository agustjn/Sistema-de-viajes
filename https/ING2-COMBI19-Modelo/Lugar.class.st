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
Lugar class >> initializeCon: unaProvincia localidad: unaLocalidad [
	^ self initializeCon: unaProvincia localidad: unaLocalidad
]

{ #category : #initialization }
Lugar >> initializeCon: unaProvincia localidad: unaLocalidad [
	provincia := unaProvincia.
	localidad := unaLocalidad
]

{ #category : #initialization }
Lugar >> localidad [ 
	^localidad
]

{ #category : #initialization }
Lugar >> provincia [ 
	^ provincia
]
