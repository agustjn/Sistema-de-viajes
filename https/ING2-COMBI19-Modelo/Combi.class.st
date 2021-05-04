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
Combi class >> initializModelo: unModelo patente: unaPatente asientos: unaCantidad chofer: unChofer tipo: unTipo [
	^ self
	initializModelo: unModelo patente: unaPatente  asientos: unaCantidad   chofer: unChofer  tipo: unTipo  
	
]

{ #category : #accessing }
Combi >> cantidadDeAsientos [
	^cantidadAsientos 
]

{ #category : #accessing }
Combi >> chofer [
	^chofer
]

{ #category : #'as yet unclassified' }
Combi >> editarModelo: unModelo cantidadAsientos: unaCantidad tipo: unTipo patente: unaPatente [

	modelo := unModelo.
	cantidadAsientos := unaCantidad.
	tipo := unTipo.
	patente := unaPatente 
]

{ #category : #initialization }
Combi >> initializeConUn: unModelo patente: unaPatente asientos: unaCantidad chofer: unChofer tipo: unTipo [
	modelo:= unModelo.
	patente := unaPatente.
	cantidadAsientos := unaCantidad.
	chofer := unChofer.
	tipo := unTipo
]

{ #category : #accessing }
Combi >> patente [
	^patente
]

{ #category : #accessing }
Combi >> tipo [
	^tipo
]
