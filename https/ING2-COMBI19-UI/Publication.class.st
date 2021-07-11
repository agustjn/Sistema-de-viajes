Class {
	#name : #Publication,
	#superclass : #WAComponent,
	#instVars : [
		'publication',
		'parent'
	],
	#category : #'ING2-COMBI19-UI-Foro-UI'
}

{ #category : #initialization }
Publication class >> of: aPublication andParent: aParent [
	^ self new
		publication: aPublication;
		parent: aParent ;
		yourself
]

{ #category : #event }
Publication >> borrarComentario [
	Combi19 soleInstance borrarPublicacion: (self publication).
]

{ #category : #event }
Publication >> editarComentario [
	self parent call: (CommentEditorView of: self publication andParent: self parent).
]

{ #category : #accessing }
Publication >> parent [
	^ parent
]

{ #category : #accessing }
Publication >> parent: anObject [
	parent := anObject
]

{ #category : #accessing }
Publication >> publication [
	^ publication
]

{ #category : #accessing }
Publication >> publication: aPublication [
	publication:=aPublication
]

{ #category : #rendering }
Publication >> renderContentOn: html [
	html strong: self publication autor nombre , ' ' , self publication autor apellido.
	html horizontalRule.
	html paragraph with: self publication contenido.
	html break.
	(self publication autor = (self session user) ) 
		ifTrue:[ html anchor
								callback:[ self editarComentario ];
								class:'my-1';
								with:[ html submitButton class:'btn btn-dark'; with:'Editar comentario'].
					].
	(Administrador allInstances includes: self session user) "Solo si es el admin, se le renderiza la opcion de borrar"
		ifTrue: [ html anchor
								callback:[ self borrarComentario ] ;
								with:[ html submitButton class:'btn btn-dark'; with:'Borrar comentario'] ].
	
]
