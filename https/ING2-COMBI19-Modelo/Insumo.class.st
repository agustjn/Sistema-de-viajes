Class {
	#name : #Insumo,
	#superclass : #Object,
	#instVars : [
		'nombre',
		'tipo',
		'precio'
	],
	#category : #'ING2-COMBI19-Modelo'
}

{ #category : #initialization }
Insumo class >> initializeCon: unNombre tipo: unTipo precio: unPrecio [
	^ self new initializeCon: unNombre tipo: unTipo precio: unPrecio
]

{ #category : #initialization }
Insumo >> = unInsumo [
  ^ (unInsumo nombre = self nombre &(unInsumo tipo = self tipo))
]

{ #category : #'as yet unclassified' }
Insumo >> editarNombre: unNombre tipo: unTipo precio: unPrecio [
	nombre := unNombre.
	tipo := unTipo.
	precio := unPrecio.
]

{ #category : #initialization }
Insumo >> initializeCon: unNombre tipo: unTipo precio: unPrecio [
	nombre := unNombre.
	tipo:= unTipo.
	precio := unPrecio
]

{ #category : #initialization }
Insumo >> nombre [ 	
	^nombre
]

{ #category : #initialization }
Insumo >> precio [
	^precio
]

{ #category : #initialization }
Insumo >> tipo [
	^tipo
]
