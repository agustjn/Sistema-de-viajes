Class {
	#name : #EditorChoferView,
	#superclass : #EditorComponent,
	#instVars : [
		'telefono'
	],
	#category : #'ING2-COMBI19-UI-Admin-UI'
}

{ #category : #'instance creation' }
EditorChoferView class >> newOf: aChofer [
	| instance |
	instance := self new.
	instance user: aChofer.
	^ instance
]

{ #category : #rendering }
EditorChoferView >> renderContentOn: html [
	self renderizarCamposBasicosOn: html.
	html text:'Telefono'.
	html break.
	(html textInput on:#telefono of:self) placeholder:user telefono
]

{ #category : #accessing }
EditorChoferView >> telefono [
	^ telefono
]

{ #category : #accessing }
EditorChoferView >> telefono: anObject [
	telefono := anObject
]
