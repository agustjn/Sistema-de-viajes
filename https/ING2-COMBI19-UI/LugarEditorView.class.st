Class {
	#name : #LugarEditorView,
	#superclass : #WAComponent,
	#instVars : [
		'place',
		'provincia',
		'localidad'
	],
	#category : #'ING2-COMBI19-UI-Lugar-UI'
}

{ #category : #'instance creation' }
LugarEditorView class >> newOf: aPlace [
	| instance |
	instance := self new.
	instance place: aPlace.
	^ instance
]

{ #category : #'as yet unclassified' }
LugarEditorView >> guardarDatos [
	place editarPronvincia: self provincia localidad: self localidad  
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

{ #category : #rendering }
LugarEditorView >> renderizarAdvertencia: html [
	html
		div: [ html heading level2 with: 'Aviso'.
			html
				unorderedList: [ html
						listItem: 'Los campos que no se quieran modificar, se deben dejar vacios.'.
					html
						listItem:
							'Los caracteres en transparente indican los datos previos a la edicion.' ] ]
]

{ #category : #rendering }
LugarEditorView >> renderizarBotonesOn: html [
html submitButton
		callback: [ self guardarDatos.
			self answer ];
		value: 'Confirmar!'.
	html space.
	html submitButton
		callback: [ self answer ];
		value: 'Cancelar'
]

{ #category : #rendering }
LugarEditorView >> renderizarCamposBasicosOn: html [
	html horizontalRule.
	html heading: 'Editar datos'.
	self renderizarAdvertencia: html.
	self renderizarCamposOn: html
	
]

{ #category : #rendering }
LugarEditorView >> renderizarCamposOn: html [ 	
	html heading: 'Editar lugar'.
	html break.
	html text: 'Provincia : '.
	(html textInput on: #provincia of: self) placeholder: place provincia.
	html break.
	html break.
	html text: 'Localidad: '.
	(html textInput on: #localidad of: self) placeholder: place localidad.
	html break
]
