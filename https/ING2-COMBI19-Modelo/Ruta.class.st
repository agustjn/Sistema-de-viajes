Class {
	#name : #Ruta,
	#superclass : #Object,
	#instVars : [
		'origen',
		'destino',
		'combi',
		'kmDeDistancia',
		'horario'
	],
	#category : #'ING2-COMBI19-Modelo'
}

{ #category : #initialization }
Ruta class >> newCon: unOrigen destino: unDestino  combi: unaCombi distancia: unaDistancia horario:unHorario [
	^ self new
		initializeCon: unOrigen
		destino: unDestino
		combi: unaCombi
		distancia: unaDistancia
		horario:unHorario
]

{ #category : #initialization }
Ruta >> = unaRuta [
	^ (unaRuta origen = self origen) & (unaRuta destino = self destino)
	 & (unaRuta combi = self combi) "& (unaRuta horario = self horario) - Esta comparacion iria?"
]

{ #category : #accessing }
Ruta >> combi [ 	
	^combi
]

{ #category : #accessing }
Ruta >> combi: anObject [
	combi := anObject
]

{ #category : #accessing }
Ruta >> destino [
	^destino
]

{ #category : #accessing }
Ruta >> destino: anObject [
	destino := anObject
]

{ #category : #accessing }
Ruta >> distancia [ 
 	^ kmDeDistancia
]

{ #category : #deprecated }
Ruta >> editarOrigen: unOrigen destino: unDestino  combi: unaCombi distancia: unaDistancia [
	origen := unOrigen.
	destino := unDestino.
	combi := unaCombi.
	kmDeDistancia := unaDistancia
]

{ #category : #'as yet unclassified' }
Ruta >> editarOrigen: unOrigen destino: unDestino  combi: unaCombi distancia: unaDistancia horario:unHorario [
	origen := unOrigen.
	destino := unDestino.
	combi := unaCombi.
	kmDeDistancia := unaDistancia.
	horario := unHorario
]

{ #category : #accessing }
Ruta >> horario [
	^ horario
]

{ #category : #accessing }
Ruta >> horario: anObject [
	horario := anObject
]

{ #category : #deprecated }
Ruta >> initializeCon: unOrigenLugar destino: unDestinoLugar  combi: unaCombi distancia: unaDistancia [
	origen := unOrigenLugar.
	destino := unDestinoLugar.
	combi := unaCombi.
	kmDeDistancia := unaDistancia
]

{ #category : #initialization }
Ruta >> initializeCon: unOrigenLugar destino: unDestinoLugar  combi: unaCombi distancia: unaDistancia horario:unHorario [
	origen := unOrigenLugar.
	destino := unDestinoLugar.
	combi := unaCombi.
	kmDeDistancia := unaDistancia.
	horario:=unHorario
]

{ #category : #accessing }
Ruta >> kmDeDistancia: anObject [
	kmDeDistancia := anObject
]

{ #category : #accessing }
Ruta >> origen [
	^origen
]

{ #category : #accessing }
Ruta >> origen: anObject [
	origen := anObject
]

{ #category : #accessing }
Ruta >> seAsociaCon: unLugar [
"Devuelve un booleano dependiendo si el lugar es el origen-destino o no de la ruta"
	^ self origen = unLugar or: (self destino = unLugar)
]

{ #category : #accessing }
Ruta >> string [
	^ 'Desde: ' , self origen string , ' hasta: ' , self destino string  , ' , con combi patente: ' , self combi patente.
]

{ #category : #accessing }
Ruta >> tiene: unaCombi [
	^ combi = unaCombi
]
