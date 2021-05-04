Class {
	#name : #Viaje,
	#superclass : #Object,
	#instVars : [
		'ruta',
		'cantidadAsientosDisponibles',
		'fecha',
		'hora',
		'precio',
		'combi'
	],
	#category : #'ING2-COMBI19-Modelo'
}

{ #category : #initialization }
Viaje class >> initializeCon: unChofer ruta: unaRuta combi: unaCombi fecha: unaFecha hora: unaHora precio: unPrecio [
	^ self
		initializeCon: unaRuta combi: unaCombi fecha: unaFecha hora: unaHora precio: unPrecio
]

{ #category : #accessing }
Viaje >> combi [
	^combi
]

{ #category : #initialization }
Viaje >> initializeCon:  unaRuta combi: unaCombi fecha: unaFecha hora: unaHora precio: unPrecio [
	ruta:= unaRuta.
	combi:= unaCombi.
	ruta:= unaRuta.
	fecha := unaFecha.
	hora:= unaHora.
	precio := unPrecio
]

{ #category : #accessing }
Viaje >> tiene: unaCombi [
	^ combi = unaCombi
]
