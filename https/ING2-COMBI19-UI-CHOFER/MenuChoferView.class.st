Class {
	#name : #MenuChoferView,
	#superclass : #WAComponent,
	#instVars : [
		'parent'
	],
	#category : #'ING2-COMBI19-UI-CHOFER-Principals-UI'
}

{ #category : #'instance creation' }
MenuChoferView class >> newWithParent: aParent [
	^ self new parent: aParent
]

{ #category : #accessing }
MenuChoferView >> parent [
	^ parent
]

{ #category : #accessing }
MenuChoferView >> parent: anObject [
	parent := anObject
]

{ #category : #rendering }
MenuChoferView >> renderContentOn: html [
 	self renderizarAnchors: html
]

{ #category : #rendering }
MenuChoferView >> renderizarAnchors: html [
	html unorderedList
		class: 'nav justify-content-center nav-tabs mb-4';
		with: [ 
			html listItem
				class: 'nav-item ml-4 ';
				with: [ html anchor
						class: 'nav-link';
						callback: [ self parent activarViajesClientView ];
						with: 'Viajes' ].
			html listItem
				class: 'nav-item ml-4';
				with: [ html anchor
						class: 'nav-link';
						callback: [ self parent activarForoView ];
						with: 'Foro' ] ]
]
