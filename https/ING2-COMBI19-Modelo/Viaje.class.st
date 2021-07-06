Class {
	#name : #Viaje,
	#superclass : #Object,
	#instVars : [
		'ruta',
		'cantAsientosDisponibles',
		'fecha',
		'precio',
		'estado',
		'clientes'
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

{ #category : #'as yet unclassified' }
Viaje >> agregarCliente: unCliente insumos: unosInsumos cantidadButacas: unaCantidad [
	"Creo un cliente que es un diccionario, con el cliente , los insumos, y la cantidad de butacas adquiridas"

	| cliente1 |
	cantAsientosDisponibles := cantAsientosDisponibles - unaCantidad.
	cliente1 := Dictionary new.
	cliente1 at: unCliente nombre put: unCliente.
	cliente1 at: 'insumos' put: unosInsumos.
	cliente1 at: 'cantidad' put: unaCantidad.
	clientes add: cliente1
]

{ #category : #accessing }
Viaje >> asignarloActivo [
	estado := 'Activo'
]

{ #category : #accessing }
Viaje >> asignarloPendiente [
	estado := 'Pendiente'
]

{ #category : #accessing }
Viaje >> cantAsientosDisponibles [
	^ cantAsientosDisponibles
]

{ #category : #accessing }
Viaje >> cantAsientosDisponibles: anObject [
	cantAsientosDisponibles := anObject
]

{ #category : #queries }
Viaje >> estaActivo [
	estado = 'Activo'
]

{ #category : #queries }
Viaje >> estaPendiente [
	^ estado = 'Pendiente'
]

{ #category : #accessing }
Viaje >> estado [
	^ estado
	
]

{ #category : #accessing }
Viaje >> fecha [
	^fecha
]

{ #category : #initialization }
Viaje >> initializeCon: unaRuta fecha: unaFecha precio: unPrecio asientos: unaCantDeAsientos [
	"Si la cantidad de asientos ingresada por el admin es vacia, asigno la cantidad de asientos por defecto de la combi"
	ruta:= unaRuta.
	cantAsientosDisponibles := unaCantDeAsientos.
	fecha := unaFecha.
	estado := 'Pendiente'.
	precio := unPrecio
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

{ #category : #accessing }
Viaje >> ruta [ 
^ ruta
]

{ #category : #accessing }
Viaje >> tiene: unaCombi [
	^ ruta combi = unaCombi
]
