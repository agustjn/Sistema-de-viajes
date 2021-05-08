Class {
	#name : #LugarEditorView,
	#superclass : #WAComponent,
	#instVars : [
		'place',
		'provincia',
		'localidad'
	],
	#category : #'ING2-COMBI19-UI-Admin-UI'
}

{ #category : #'instance creation' }
LugarEditorView class >> newOf: aPlace [
	| instance |
	instance := self new.
	instance place: aPlace.
	^ instance
]

{ #category : #accessing }
LugarEditorView >> localidad [
	^ localidad
]

{ #category : #accessing }
LugarEditorView >> localidad: anObject [
	localidad := anObject
]

{ #category : #accessing }
LugarEditorView >> place [
	^ place
]

{ #category : #accessing }
LugarEditorView >> place: anObject [
	place := anObject
]

{ #category : #accessing }
LugarEditorView >> provincia [
	^ provincia
]

{ #category : #accessing }
LugarEditorView >> provincia: anObject [
	provincia := anObject
]

{ #category : #rendering }
LugarEditorView >> renderContentOn: html [
	html heading: 'Editar lugar'.
	html break.
	html text:'Provincia : '.
	(html textInput on:#provincia of:self)placeholder: place provincia.
	html break. 
	html break.
	html text:'Localidad: '.
	(html textInput on:#localidad of:self)placeholder: place localidad.
	html break.
	
	
]
