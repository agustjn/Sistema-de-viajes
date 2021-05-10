Class {
	#name : #CombiView,
	#superclass : #WAComponent,
	#instVars : [
		'parent'
	],
	#category : #'ING2-COMBI19-UI-Combi-CRUD-UI'
}

{ #category : #'instance creation' }
CombiView class >> newWithParent: aParent [
	| instance |
	instance := self new.
	instance parent: aParent.
	^instance
]

{ #category : #accessing }
CombiView >> combis [
	self model administrador combis
]

{ #category : #accesing }
CombiView >> model [
	^Combi19 soleInstance
]

{ #category : #accessing }
CombiView >> parent [
	^ parent
]

{ #category : #accessing }
CombiView >> parent: anObject [
	parent := anObject
]

{ #category : #rendering }
CombiView >> renderContentOn: html [
	html heading: 'Pantalla de CRUD Combis'.
	self renderizarCombisOn: html.
	html anchor
		callback: [ self parent activarCombiCreationView ];
		with: [ html submitButton with: 'Crear Combi' ]
]

{ #category : #rendering }
CombiView >> renderizarCombisOn: html [
	self combis
		ifNil:
				[ html heading level4 with: 'No hay Combis cargadados en el sistema' ];
		ifNotNil: [ html
				unorderedList: [ self model administrador combis
						do: [ :combi | 
							html
								listItem: [ html render: (CombiSelector of: combi andParent: self) ] ] ] ]
]
