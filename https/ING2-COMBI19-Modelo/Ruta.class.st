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

{ #category : #accessing }
Ruta >> tiene: unaCombi [
	^ combi = unaCombi
]
