Class {
	#name : #InsumoView,
	#superclass : #Object,
	#instVars : [
		'parent'
	],
	#category : #'ING2-COMBI19-UI-Insumo-UI'
}

{ #category : #'instance creation' }
InsumoView class >> newWithParent: aParent [
	^ self new parent: aParent
]

{ #category : #accessing }
InsumoView >> model [
	^Combi19 soleInstance
]

{ #category : #accessing }
InsumoView >> parent [ ^parent
]

{ #category : #accessing }
InsumoView >> parent: aParent [
	parent:= aParent 
]

{ #category : #rendering }
InsumoView >> renderContentOn: html [ 	
	html heading: 'Pantalla de CRUD Insumos'.
	self renderizarInsumos: html.
	html anchor
		callback: [ self parent activarInsumosCreationView ];
		with: [ html submitButton with: 'Crear Insumo' ]
]

{ #category : #'as yet unclassified' }
InsumoView >> renderizarInsumos: html [
	self model administrador insumos
		ifNil:
				[ html heading level4 with: 'No hay Insumos cargadados en el sistema' ];
		ifNotNil: [ html
				unorderedList: [ self model administrador insumos
											do: [ :insumo | 
							html
								listItem: [ html render: (ChoferSelector of: self insumo andParent: self) ] ] ] ]
	
]
