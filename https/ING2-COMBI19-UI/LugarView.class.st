Class {
	#name : #LugarView,
	#superclass : #WAComponent,
	#instVars : [
		'parent'
	],
	#category : #'ING2-COMBI19-UI-Lugar-CRUD-UI'
}

{ #category : #'instance creation' }
LugarView class >> newWithParent: aParent [
	| instance |
	instance := self new.
	instance parent: aParent.
	^instance
]

{ #category : #model }
LugarView >> model [
	^Combi19 soleInstance
]

{ #category : #accessing }
LugarView >> parent [
	^ parent
]

{ #category : #accessing }
LugarView >> parent: anObject [
	parent := anObject
]

{ #category : #rendering }
LugarView >> renderContentOn: html [
	html heading: 'Lugares del sistema'.
	self renderizarLugares: html.
	html anchor
				callback:[ self parent activarLugarCreationView ] ; 
				with:[ html submitButton with:'Crear lugar' ]
				

]

{ #category : #rendering }
LugarView >> renderizarLugares: html [
	html
		unorderedList: [ (self model administrador lugares)
				do: [ :lugar | 
					html
						listItem: [ html render: (LugarSelector of: lugar andParent: self) ] ] ]
]
