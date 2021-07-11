Class {
	#name : #Viaje,
	#superclass : #Object,
	#instVars : [
		'ruta',
		'cantAsientosDisponibles',
		'fecha',
		'precio',
		'estado',
		'clientes',
		'rechazados'
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
Viaje >> agregarCliente: unCliente [
	clientes add: unCliente 
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
Viaje >> clientes [
	^ clientes
]

{ #category : #'as yet unclassified' }
Viaje >> eliminarCliente: unCliente [
	clientes remove: unCliente
]

{ #category : #'as yet unclassified' }
Viaje >> esta: unFiltro [
	^ self estado = unFiltro 
]

{ #category : #'as yet unclassified' }
Viaje >> estaPendiente [ 
	^ self estado = 'Pendiente'
]

{ #category : #queries }
Viaje >> estado [
	^ estado
]

{ #category : #queries }
Viaje >> estado: unEstado [
	estado := unEstado.
	
]

{ #category : #accessing }
Viaje >> fecha [
	^fecha
]

{ #category : #initialization }
Viaje >> initializeCon: unaRuta fecha: unaFecha precio: unPrecio asientos: unaCantDeAsientos [
	"Si la cantidad de asientos ingresada por el admin es vacia, asigno la cantidad de asientos por defecto de la combi"

	ruta := unaRuta.
	cantAsientosDisponibles := unaCantDeAsientos.
	fecha := unaFecha.
	estado := 'Pendiente'.
	precio := unPrecio.
	clientes:= OrderedCollection new 
]

{ #category : #accessing }
Viaje >> modificarDatosConRuta: unaRuta fecha: unaFecha precio: unPrecio asientos: unaCantidad [
	ruta := unaRuta.
	unaFecha = ''
		ifFalse: [ fecha := unaFecha ].
	unPrecio = ''
		ifFalse: [ precio := unPrecio ].
	unaCantidad = ''
		ifFalse: [ self cantAsientosDisponibles: unaCantidad ]
]

{ #category : #'as yet unclassified' }
Viaje >> origen: unOrigen destino: unDestino fecha: unaFecha [
	^ (self ruta origen = unOrigen )& (self ruta destino = unDestino)
		& (self fecha = unaFecha) & (self estaPendiente)
]

{ #category : #accessing }
Viaje >> precio [
	^precio
]

{ #category : #operations }
Viaje >> restarAsientos: cantAsientos [
	cantAsientosDisponibles >= (cantAsientos asNumber)
		ifTrue: [ cantAsientosDisponibles := cantAsientosDisponibles - (cantAsientos asNumber) ]

]

{ #category : #accessing }
Viaje >> ruta [ 
^ ruta
]

{ #category : #accessing }
Viaje >> tiene: unaCombi [
	^ ruta combi = unaCombi
]
