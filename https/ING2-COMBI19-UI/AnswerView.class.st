Class {
	#name : #AnswerView,
	#superclass : #WAComponent,
	#instVars : [
		'text',
		'author',
		'parent',
		'errorView'
	],
	#category : #'ING2-COMBI19-UI-Foro-UI'
}

{ #category : #initialize }
AnswerView class >> withParent: aParent [
	^ self new parent: aParent ;
				yourself.
]

{ #category : #accessing }
AnswerView >> author [
	^ author
]

{ #category : #accessing }
AnswerView >> author: anObject [
	author := anObject
]

{ #category : #event }
AnswerView >> cancelar [
	text := ''.
]

{ #category : #accessing }
AnswerView >> parent [
	^ parent
]

{ #category : #accessing }
AnswerView >> parent: anObject [
	parent := anObject
]

{ #category : #rendering }
AnswerView >> renderContentOn: html [
"	html render:errorView."
	html
		form: [ (html textArea on: #text of: self)
				columns: 80;
				rows: 3.
			html break.
			html div
				class: 'container';
				with: [ html submitButton class: 'btn btn-dark mx-4 my-4';
						callback: [ self responder ];
						with:'Guardar'.
					html submitButton
						class: 'btn btn-dark mx-4 my-4';
						callback: [ self cancelar ];
						with: 'Borrar';
						yourself ] ]
]

{ #category : #event }
AnswerView >> renderizarError [ 
		self parent errorView: (GenericAdvertiseView
		newWithParent: self
		heading: 'Error al realizar publicacion'
		item1: 'El contenido debe superar los 10 caracteres.'
		item2: nil
		item3: nil)
]

{ #category : #event }
AnswerView >> responder [
	| publication |
	publication := Publicacion de: self session user conContenido: text.
	(Combi19 soleInstance validarPublicacion: publication)
		ifTrue: [ Combi19 soleInstance
				agregarPublicacion: (Publicacion de: self session user conContenido: text).
				self parent errorView: nil]
		ifFalse: [ self renderizarError ].
	text := ''
]

{ #category : #accessing }
AnswerView >> text [
	^ text
]

{ #category : #accessing }
AnswerView >> text: anObject [
	text := anObject
]
