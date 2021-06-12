Class {
	#name : #LugarView,
	#superclass : #WAComponent,
	#instVars : [
		'parent',
		'deleteErrorView'
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

{ #category : #event }
LugarView >> renderAdvertencia: text [ 
	deleteErrorView := GenericAdvertiseView
		newWithParent: self
		heading: 'Eliminacion del lugar '
		item1: text
		item2: nil
		item3: nil
]

{ #category : #rendering }
LugarView >> renderContentOn: html [
	deleteErrorView := nil.
	html heading level4 with: 'Listado de Lugares del sistema'.
	html horizontalRule. 
	html anchor
		callback: [ self parent activarLugarCreationView ];
		with: [ html submitButton
				class: 'btn btn-dark mx-4 my-4';
				with: 'Crear Lugar' ].
	self model administrador lugares isEmpty
		ifTrue:
				[ html heading level4 with: 'No hay lugares cargadados en el sistema' ];
		ifFalse: [ self renderizarLugares: html ].
	html render: deleteErrorView.
	
]

{ #category : #rendering }
LugarView >> renderizarLugares: html [
	html unorderedList
		class: 'row';
		with: [ self model administrador lugares
				do: [ :lugar | 
					html listItem
						class: 'card col-md-3 bg-white border-warning mx-4 my-4';
						with: [ html render: (LugarSelector of: lugar andParent: self) ] ] ]
]
