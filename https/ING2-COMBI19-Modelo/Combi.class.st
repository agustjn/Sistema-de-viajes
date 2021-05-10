Class {
	#name : #Combi,
	#superclass : #Object,
	#instVars : [
		'patente',
		'cantidadAsientos',
		'chofer',
		'tipo',
		'modelo'
	],
	#category : #'ING2-COMBI19-Modelo'
}

{ #category : #initialization }
Combi class >> initializeModelo: unModelo patente: unaPatente asientos: unaCantidad chofer: unChofer tipo: unTipo [
	^ (self new)
		initializeConUn: unModelo
		patente: unaPatente
		asientos: unaCantidad
		chofer: unChofer
		tipo: unTipo
]

{ #category : #accessing }
Combi >> cantidadAsientos: anObject [
	cantidadAsientos := anObject
]

{ #category : #accessing }
Combi >> cantidadDeAsientos [
	^cantidadAsientos 
]

{ #category : #accessing }
Combi >> chofer [
	^chofer
]

{ #category : #accessing }
Combi >> chofer: anObject [
	chofer := anObject
]

{ #category : #'as yet unclassified' }
Combi >> editarModelo: unModelo cantidadAsientos: unaCantidad tipo: unTipo patente: unaPatente [
	unModelo = ''
		ifFalse: [ modelo := unModelo ].
	unaCantidad = ''
		ifFalse: [ cantidadAsientos := unaCantidad ].
	unTipo = ''
		ifFalse: [ tipo := unTipo ].
	unaPatente = '' ifFalse: [patente := unaPatente]
]

{ #category : #initialization }
Combi >> initializeConUn: unModelo patente: unaPatente asientos: unaCantidad chofer: unChofer tipo: unTipo [
	modelo := unModelo.
	patente := unaPatente.
	cantidadAsientos := unaCantidad.
	chofer := unChofer.
	tipo := unTipo.
	chofer estaOcupado.
]

{ #category : #accessing }
Combi >> modelo [
	^ modelo
]

{ #category : #accessing }
Combi >> modelo: anObject [
	modelo := anObject
]

{ #category : #accessing }
Combi >> patente [
	^patente
]

{ #category : #accessing }
Combi >> patente: anObject [
	patente := anObject
]

{ #category : #accessing }
Combi >> tipo [
	^tipo
]

{ #category : #accessing }
Combi >> tipo: anObject [
	tipo := anObject
]
