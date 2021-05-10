Class {
	#name : #Ruta,
	#superclass : #Object,
	#instVars : [
		'origen',
		'destino',
		'combi',
		'horario',
		'kmDeDistancia'
	],
	#category : #'ING2-COMBI19-Modelo'
}

{ #category : #initialization }
Ruta class >> initializeCon: unOrigen destino: unDestino horario: unaHora combi: unaCombi distancia: unaDistancia [
	^ self new
		initializeCon: unOrigen
		destino: unDestino
		horario: unaHora
		combi: unaCombi
		distancia: unaDistancia
]

{ #category : #initialization }
Ruta >> = unaRuta [
	^ (unaRuta origen = self origen) & (unaRuta destino = self destino)
		& (unaRuta horario = self horario) & (unaRuta combi = self combi)
]

{ #category : #accessing }
Ruta >> combi [ 	
	^combi
]

{ #category : #accessing }
Ruta >> destino [
	^destino
]

{ #category : #accessing }
Ruta >> distancia [ 
 	^ kmDeDistancia
]

{ #category : #'as yet unclassified' }
Ruta >> editarOrigen: unOrigen destino: unDestino horario: unHorario combi: unaCombi distancia: unaDistancia [
	origen := unOrigen.
	destino := unDestino.
	horario := unHorario.
	combi := unaCombi.
	kmDeDistancia := unaDistancia.
]

{ #category : #accessing }
Ruta >> horario [
	^horario
]

{ #category : #initialization }
Ruta >> initializeCon: unOrigenLugar destino: unDestinoLugar horario: unaHora combi: unaCombi distancia: unaDistancia [
	origen := unOrigenLugar.
	destino := unDestinoLugar.
	horario := unaHora.
	combi := unaCombi.
	kmDeDistancia := unaDistancia
]

{ #category : #accessing }
Ruta >> origen [
	^origen
]

{ #category : #accessing }
Ruta >> tiene: unaCombi [
	^ combi = unaCombi
]
