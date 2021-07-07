Class {
	#name : #MenuAdminView,
	#superclass : #WAComponent,
	#instVars : [
		'admin',
		'choferView',
		'parent'
	],
	#category : #'ING2-COMBI19-UI-ADMIN-Components'
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
MenuAdminView >> renderContentOn: aCanvas [
	self renderizarAnchors: aCanvas.
		
]

{ #category : #rendering }
MenuAdminView >> renderizarAnchors: aCanvas [
	
				aCanvas unorderedList
				class:'nav justify-content-center nav-tabs mb-4';
					with:[ aCanvas
							listItem
							class:'nav-item ml-4 ';
				
							with: [ aCanvas anchor
								class: 'nav-link';
								callback: [ self parent activarChoferView ];
								with: 'Choferes' ].
						aCanvas
						listItem
						class:'nav-item ml-4';
							with:[ aCanvas anchor
							class: 'nav-link';
							callback: [ self parent activarCombiView ];
							with: 'Combis' ].
			aCanvas
				listItem
				class:'nav-item ml-4';
				with: [ aCanvas anchor
						class: 'nav-link';
						callback: [ self parent activarViajeView ];
						with: 'Viajes' ].
			aCanvas
				listItem
				class:'nav-item ml-4';
				with: [ aCanvas anchor
						class: 'nav-link';
						callback: [  self parent activarRutasView ];
						with: 'Rutas' ].
			aCanvas
				listItem
				class:'nav-item ml-4';
				with: [ aCanvas anchor
						class: 'nav-link';
						callback: [ self parent activarLugarView ];
						with: 'Lugares' ].
			aCanvas
				listItem
				class:'nav-item ml-4';
				with: [ aCanvas anchor
						class: 'nav-link';
						callback: [ self parent activarInsumoView ];
						with: 'Insumos' ].
			aCanvas
				listItem
				class:'nav-item ml-4';
				with: [ aCanvas anchor
						class: 'nav-link';
						callback: [ self parent activarForoView ];
						with: 'Foro' ]. ]
				
			
]

{ #category : #updating }
MenuAdminView >> updateRoot: anHtmlRoot [ 
    super updateRoot: anHtmlRoot.
    anHtmlRoot stylesheet url: 'https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css'
]
