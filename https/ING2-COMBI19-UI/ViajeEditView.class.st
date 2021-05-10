Class {
	#name : #ViajeEditView,
	#superclass : #WAComponent,
	#instVars : [
		'parent',
		'viaje'
	],
	#category : #'ING2-COMBI19-UI-Viaje-UI'
}

{ #category : #'instance creation' }
ViajeEditView class >> newOf: aViaje [
	self new viaje: aViaje
]

{ #category : #rendering }
ViajeEditView >> renderContentOn: html [
	html
		form: [ self renderizarCamposBasicosOn: html.
			html horizontalRule.
			self renderizarBotonesOn: html ]
]

{ #category : #accessing }
ViajeEditView >> viaje [ ^viaje
]

{ #category : #accessing }
ViajeEditView >> viaje: aViaje [
	viaje:= aViaje
]
