Class {
	#name : #Viaje,
	#superclass : #Object,
	#instVars : [
		'ruta',
		'cantAsientosDisponibles',
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

{ #category : #comparing }
Viaje >> = unViaje [
	  ^ ((self ruta = unViaje ruta ) & (self fecha = unViaje fecha ) & ( self hora = unViaje hora ))
]

{ #category : #accessing }
Viaje >> cantAsientosDisponibles [
	^ cantAsientosDisponibles
]

{ #category : #accessing }
Viaje >> cantAsientosDisponibles: anObject [
	cantAsientosDisponibles := anObject
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
	cantAsientosDisponibles := unaRuta combi cantidadAsientos.
	fecha := unaFecha.
	hora := unaHora.
	precio := unPrecio
]

{ #category : #accessing }
Viaje >> modificarDatosConRuta: unaRuta fecha: unaFecha hora: unaHora precio: unPrecio [
	ruta := unaRuta .
	
	unaFecha = ''
		ifFalse: [ fecha := unaFecha ].
	unaHora = ''
		ifFalse: [ hora := unaHora ].
	unPrecio = ''
		ifFalse: [ precio := unPrecio ]
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
