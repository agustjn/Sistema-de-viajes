Class {
	#name : #Insumo,
	#superclass : #Object,
	#instVars : [
		'nombre',
		'marca',
		'precio'
	],
	#category : #'ING2-COMBI19-Modelo'
}

{ #category : #initialization }
Insumo class >> newNombre: unNombre marca: unaMarca precio: unPrecio [
	^ self new
				nombre: unNombre ;
				marca: unaMarca;
				precio: unPrecio ;
				yourself
]

{ #category : #'as yet unclassified' }
Insumo >> editarNombre: unNombre marca: unaMarca precio: unPrecio [
	nombre := unNombre.
	marca := unaMarca.
	precio := unPrecio.
]

{ #category : #initialization }
Insumo >> initializeCon: unNombre tipo: unTipo precio: unPrecio [
	nombre := unNombre.
	tipo:= unTipo.
	precio := unPrecio
]

{ #category : #accessing }
Insumo >> marca [
	^ marca
]

{ #category : #accessing }
Insumo >> marca: anObject [
	marca := anObject
]

{ #category : #initialization }
Insumo >> nombre [ 	
	^nombre
]

{ #category : #accessing }
Insumo >> nombre: anObject [
	nombre := anObject
]

{ #category : #initialization }
Insumo >> precio [
	^precio
]

{ #category : #accessing }
Insumo >> precio: anObject [
	precio := anObject
]
