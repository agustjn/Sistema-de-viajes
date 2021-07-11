Class {
	#name : #CommentEditorView,
	#superclass : #WAComponent,
	#instVars : [
		'publication',
		'text',
		'parent',
		'errorView'
	],
	#category : #'ING2-COMBI19-UI-Foro-UI'
}

{ #category : #'instance creation' }
CommentEditorView class >> of: aPublication andParent: aParent [
	^ self new
		publication: aPublication;
		parent: aParent;
		yourself
]

{ #category : #event }
CommentEditorView >> cancelarEdicion [
	self answer.
]

{ #category : #event }
CommentEditorView >> guardarEdicion [
	(text size > 10)
		ifTrue:[self publication contenido: text.
				  self parent errorView: nil.
				  self answer]
		ifFalse:[self renderizarError]
	
]

{ #category : #accessing }
CommentEditorView >> parent [
	^ parent
]

{ #category : #accessing }
CommentEditorView >> parent: anObject [
	parent := anObject
]

{ #category : #accessing }
CommentEditorView >> publication [
	^ publication
]

{ #category : #accessing }
CommentEditorView >> publication: anObject [
	publication := anObject
]

{ #category : #rendering }
CommentEditorView >> renderContentOn: html [
	html div class:'container' ; with: [  
	html heading level3 with: 'Edicion de comentario'.
	html break.
	html strong: 'El contenido debe superar los 10 caracteres'.
	html break ; break.
	html render: errorView.
	html break.
	html
		form: [ (html textArea on: #text of: self)
				columns: 80;
				rows: 3.
			html break.
			self text: (self publication contenido).
			self renderizarBotones: html ] ]
]

{ #category : #'as yet unclassified' }
CommentEditorView >> renderizarBotones: html [
			html div
				class: 'container';
				with: [ html submitButton
						class: 'btn btn-dark mx-4 my-4';
						callback: [ self guardarEdicion];
						with: 'Guardar'.
					html submitButton
						class: 'btn btn-dark mx-4 my-4';
						callback: [ self cancelarEdicion ];
						with: 'Cancelar';
						yourself ]. 
]

{ #category : #event }
CommentEditorView >> renderizarError [
	errorView := (GenericAdvertiseView newWithParent: self heading:'Error al editar comentario'  item1:'La cantidad de caracteres ingresados es igual o inferior a 10 caracteres.'  item2:nil  item3:nil)
]

{ #category : #accessing }
CommentEditorView >> text [
	^ text
]

{ #category : #accessing }
CommentEditorView >> text: anObject [
	text := anObject
]
