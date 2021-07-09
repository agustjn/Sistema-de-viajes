Class {
	#name : #MenuClientView,
	#superclass : #WAComponent,
	#instVars : [
		'parent'
	],
	#category : #'ING2-COMBI19-UI-CLIENTE-Principales-UI'
}

{ #category : #'instance creation' }
MenuClientView class >> newWithParent: aParent [
	| instance |
	instance := self new.
	instance parent: aParent.
	^instance
	
]

{ #category : #accessing }
MenuClientView >> parent [
	^ parent
]

{ #category : #accessing }
MenuClientView >> parent: anObject [
	parent := anObject
]

{ #category : #rendering }
MenuClientView >> renderContentOn: html [
	self renderizarAnchors: html
]

{ #category : #rendering }
MenuClientView >> renderizarAnchors: html [
	html unorderedList
		class: 'nav justify-content-center nav-tabs mb-4';
		with: [ html listItem
				class: 'nav-item ml-4 ';
				with: [ html anchor
						class: 'nav-link';
						callback: [ self session user renderizarEliminado.self parent activarViajesClientView ];
						with: 'Viajes' ].
			html listItem
				class: 'nav-item ml-4';
				with: [ html anchor
						class: 'nav-link';
						callback: [ self session user renderizarEliminado.  self parent activarForoView ];
						with: 'Foro' ].
			html listItem
				class: 'nav-item ml-4 ';
				with: [ html anchor
						class: 'nav-link';
						callback: [self session user renderizarEliminado. self parent activarModificarCuentaView ];
						with: 'Modificar datos' ] ]
]

{ #category : #event }
MenuClientView >> updateRoot: anHtmlRoot [ 
    super updateRoot: anHtmlRoot.
    anHtmlRoot stylesheet url: 'https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css'
]
