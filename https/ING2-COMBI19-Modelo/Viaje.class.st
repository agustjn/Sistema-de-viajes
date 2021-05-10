Class {
	#name : #Viaje,
	#superclass : #Object,
	#instVars : [
		'ruta',
		'cantidadAsientosDisponibles',
		'fecha',
		'hora',
		'precio'
	],
	#category : #'ING2-COMBI19-Modelo'
}

{ #category : #initialization }
Viaje class >> initializeCon: unaRuta fecha: unaFecha hora: unaHora precio: unPrecio [
	^ self new
		initializeCon: unaRuta
		fecha: unaFecha
		hora: unaHora
		precio: unPrecio
]

{ #category : #accessing }
Viaje >> fecha [
	^fecha
]

{ #category : #accessing }
Viaje >> hora [
	^hora
]

{ #category : #initialization }
Viaje >> initializeCon: unaRuta fecha: unaFecha hora: unaHora precio: unPrecio [
	ruta := unaRuta.

	fecha := unaFecha.
	hora := unaHora.
	precio := unPrecio
]

{ #category : #accessing }
Viaje >> precio [
	^precio
]

{ #category : #accessing }
Viaje >> ruta [ 
^ ruta
]

{ #category : #accessing }
Viaje >> tiene: unaCombi [
	^ ruta combi = unaCombi
]
