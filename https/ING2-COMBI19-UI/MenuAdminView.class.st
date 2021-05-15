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
	^ Combi19 soleInstance 
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
MenuAdminView >> renderizarAnchors: aCanvas [
aCanvas navigation
	class:'navbar navbar-expand-lg navbar-light bg-light mb-4';
	with: [
		aCanvas div 
			class: 'collapse navbar-collapse';
			with:[
				aCanvas unorderedList
				class:'navbar-nav mr-auto';
					with:[ aCanvas
				listItem
				class:'nav-item ml-4';
				with: [ aCanvas anchor
						callback: [ self parent activarChoferView ];
						with: 'Choferes' ].
			aCanvas
				listItem
				class:'nav-item ml-4';
				with:[ aCanvas anchor
						callback: [ self parent activarCombiView ];
						with: 'Combis' ].
			aCanvas
				listItem
				class:'nav-item ml-4';
				with: [ aCanvas anchor
						callback: [ self parent activarViajeView ];
						with: 'Viajes' ].
			aCanvas
				listItem
				class:'nav-item ml-4';
				with: [ aCanvas anchor
						callback: [  self parent activarRutasView ];
						with: 'Rutas' ].
			aCanvas
				listItem
				class:'nav-item ml-4';
				with: [ aCanvas anchor
						callback: [ self parent activarLugarView ];
						with: 'Lugares' ].
			aCanvas
				listItem
				class:'nav-item ml-4';
				with: [ aCanvas anchor
						callback: [ self parent activarInsumoView ];
						with: 'Insumos' ] ]
				
				].
		
		].
		

]
