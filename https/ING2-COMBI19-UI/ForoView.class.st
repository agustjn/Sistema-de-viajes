Class {
	#name : #ForoView,
	#superclass : #WAComponent,
	#instVars : [
		'parent',
		'answerView',
		'errorView'
	],
	#category : #'ING2-COMBI19-UI-Foro-UI'
}

{ #category : #initialization }
ForoView class >> newWithParent: theParent [
	^ self new parent: theParent
]

{ #category : #initialization }
ForoView class >> newWithParent: theParent errorState: aBoolean [
	^ self new parent: theParent ;
				  errorState:aBoolean ;
				  yourself.
]

{ #category : #accessing }
ForoView >> errorView [
	^ errorView
]

{ #category : #accessing }
ForoView >> errorView: anObject [
	errorView := anObject
]

{ #category : #accessing }
ForoView >> model [ 
	^ Combi19 soleInstance
]

{ #category : #accessing }
ForoView >> parent [
	^ parent
]

{ #category : #accessing }
ForoView >> parent: aParent [
	parent:= aParent
]

{ #category : #rendering }
ForoView >> renderContentOn: html [
	html heading level4 with: 'Listado de publicaciones'.
	html horizontalRule.
	self model publicaciones isEmpty
		ifFalse: [ self renderizarPublicaciones: html ]
		ifTrue: [ html break.
			html heading level3 with: 'No hay publicaciones en el sistema' ].
	html horizontalRule.
	html render:errorView.
	html div
		class: 'container';
		with: [ html render: (AnswerView withParent: self) ].
	html horizontalRule
]

{ #category : #rendering }
ForoView >> renderizarPublicaciones:html [ 	
	html unorderedList
					class: 'row';
					with: [ self model publicaciones
							do: [ :publication | 
								html listItem
									class: 'card col-sm-9 bg-white border-warning mx-4 my-4';
									with: [ html render: (Publication of: publication andParent: self) ] ] ]
							
]
