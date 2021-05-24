Class {
	#name : #Viaje,
	#superclass : #Object,
	#instVars : [
		'ruta',
		'cantAsientosDisponibles',
		'fecha',
		'precio',
		'estaActivo'
	],
	#category : #'ING2-COMBI19-Modelo'
}

{ #category : #initialization }
Viaje class >> newCon: unaRuta fecha: unaFecha precio: unPrecio asientos:cantDeAsientos [
	^ self new
		initializeCon: unaRuta
		fecha: unaFecha
		precio: unPrecio
		asientos: cantDeAsientos
]

{ #category : #comparing }
Viaje >> = unViaje [
	  ^ ((self ruta = unViaje ruta ) & (self fecha = unViaje fecha ) )
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

{ #category : #initialization }
Viaje >> initializeCon: unaRuta fecha: unaFecha precio: unPrecio asientos: unaCantDeAsientosIngresada [
	ruta := unaRuta.
	unaCantDeAsientosIngresada
		ifEmpty: [ cantAsientosDisponibles := unaRuta combi cantidadAsientos ]
		ifNotEmpty: [ cantAsientosDisponibles := unaCantDeAsientosIngresada ].	
			"Si la cantidad de asientos ingresada por el admin es vacia, asigno la cantidad de asientos por defecto de la combi"
	fecha := unaFecha.
	precio := unPrecio
]

{ #category : #accessing }
Viaje >> modificarDatosConRuta: unaRuta fecha: unaFecha precio: unPrecio [
	ruta := unaRuta .
	unaFecha = ''
		ifFalse: [ fecha := unaFecha ].
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
