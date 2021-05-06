Class {
	#name : #ChoferView,
	#superclass : #WAComponent,
	#instVars : [
		'parent'
	],
	#category : #'ING2-COMBI19-UI-Admin-UI'
}

{ #category : #'instance creation' }
ChoferView class >> newWithParent: aParent [
	| instance |
	instance := self new.
	instance parent: aParent.
	^instance
]

{ #category : #accessing }
ChoferView >> model [
	^ Combi19 soleInstance
]

{ #category : #accessing }
ChoferView >> parent [
	^ parent
]

{ #category : #accessing }
ChoferView >> parent: anObject [
	parent := anObject
]

{ #category : #rendering }
ChoferView >> renderContentOn: html [
	html heading: 'Pantalla de CRUD Choferes'.
	self renderizarChoferes: html.
	html anchor
				callback:[ self parent activarChoferCreationView ] ; 
				with:[ html submitButton with:'Crear chofer' ]
]

{ #category : #rendering }
ChoferView >> renderizarChoferes: html [
	html
		unorderedList: [ self model choferes
				do: [ :chofer | 
					html
						listItem: [ html render: (ChoferSelector of: chofer andParent: self) ] ] ]
]
