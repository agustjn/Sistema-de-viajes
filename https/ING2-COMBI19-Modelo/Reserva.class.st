Class {
	#name : #Reserva,
	#superclass : #Object,
	#instVars : [
		'viaje',
		'cupos',
		'insumos',
		'tarjeta'
	],
	#category : #'ING2-COMBI19-Modelo'
}

{ #category : #'as yet unclassified' }
Reserva class >> conInsumos: insumosComprados cupos: cantAsientos delViaje: unViaje yTarjeta: tarjetaUtilizada [
	^ self new
		insumos: insumosComprados;
		cupos: cantAsientos;
		viaje: unViaje;
		tarjeta: tarjetaUtilizada;
		yourself
]

{ #category : #accessing }
Reserva >> cupos [
	^ cupos
]

{ #category : #accessing }
Reserva >> cupos: anObject [
	cupos := anObject
]

{ #category : #accessing }
Reserva >> insumos [
	^ insumos
]

{ #category : #accessing }
Reserva >> insumos: anObject [
	insumos := anObject
]

{ #category : #accessing }
Reserva >> tarjeta [
	^ tarjeta
]

{ #category : #accessing }
Reserva >> tarjeta: anObject [
	tarjeta := anObject
]

{ #category : #accessing }
Reserva >> viaje [
	^ viaje
]

{ #category : #accessing }
Reserva >> viaje: anObject [
	viaje := anObject
]
