Class {
	#name : #MenuAdminView,
	#superclass : #WAComponent,
	#instVars : [
		'admin',
		'choferView',
		'parent'
	],
	#category : #'ING2-COMBI19-UI-Admin-UI'
}

{ #category : #'instance creation' }
MenuAdminView class >> newWithParent: aParent [
	| instance |
	instance := self new.
	instance parent: aParent.
	^instance
	
]

{ #category : #initializing }
MenuAdminView >> initialize [
	super initialize.
	admin := self session user.
]

{ #category : #accessing }
MenuAdminView >> model [
	^Combi19 soleInstance	
]

{ #category : #accessing }
MenuAdminView >> parent [
	^ parent
]

{ #category : #accessing }
MenuAdminView >> parent: anObject [
	parent := anObject
]

{ #category : #rendering }
MenuAdminView >> renderContentOn: html [
	self renderizarAnchors: html.
		
]

{ #category : #rendering }
MenuAdminView >> renderizarAnchors: html [.
		html
		unorderedList: [ html
				listItem: [ html anchor
						callback: [ self parent activarChofer ];
						with: 'Choferes' ].
			html
				listItem: [ html anchor
						callback: [ self parent activarCombiView ];
						with: 'Combis' ].
			html
				listItem: [ html anchor
						callback: [  ];
						with: 'Viajes' ].
			html
				listItem: [ html anchor
						callback: [  ];
						with: 'Rutas' ].
			html
				listItem: [ html anchor
						callback: [  ];
						with: 'Lugares' ] ]
]
