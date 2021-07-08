Class {
	#name : #InsumoComponent,
	#superclass : #WAComponent,
	#instVars : [
		'insumoSelected'
	],
	#category : #'ING2-COMBI19-UI-CLIENTE-Viajes-UI'
}

{ #category : #accessing }
InsumoComponent >> insumoSelected [
	^ insumoSelected
]

{ #category : #accessing }
InsumoComponent >> insumoSelected: anObject [
	insumoSelected := anObject
]

{ #category : #accessing }
InsumoComponent >> model [
	^ Combi19 soleInstance 
]

{ #category : #rendering }
InsumoComponent >> renderContentOn: html [
	html select
		list: self model administrador insumosString ;
		callback: [ :value | self insumoSelected: value ].
	html break; break .
]

{ #category : #queries }
InsumoComponent >> valor [
	^ (self model administrador buscarInsumoConString: insumoSelected) precio
]
