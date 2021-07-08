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

{ #category : #comparing }
Insumo >> = unInsumo [
 ^ unInsumo marca = self marca & (unInsumo nombre = self nombre )
]

{ #category : #'as yet unclassified' }
Insumo >> editarNombre: unNombre marca: unaMarca precio: unPrecio [
	unNombre  ifNotEmpty: [  nombre := unNombre].
	unaMarca ifNotEmpty: [ 
	marca := unaMarca].
	unPrecio ifNotEmpty: [precio := unPrecio]
]

{ #category : #'as yet unclassified' }
Insumo >> estaCompleto [
	^ (nombre isNotEmpty & marca isNotEmpty & precio isNotEmpty)
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

{ #category : #accessing }
Insumo >> string [
	^ (self nombre  , ' ' , self marca, ' $' , self precio) asString
]
