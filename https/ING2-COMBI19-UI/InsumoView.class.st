Class {
	#name : #InsumoView,
	#superclass : #WAComponent,
	#instVars : [
		'parent'
	],
	#category : #'ING2-COMBI19-UI-Insumo-CRUD-UI'
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
	html heading level4 with:'Listado de Insumos del sistema'.
	self renderizarInsumos: html.
	html anchor
		callback: [ self parent activarInsumosCreationView ];
		with: [ html submitButton
				class: 'btn btn-dark mx-4 my-4' ;
				with: 'Crear Insumo' ].
]

{ #category : #'as yet unclassified' }
InsumoView >> renderizarInsumos: html [
	self model administrador insumos isEmpty
		ifTrue:
				[ html heading level3 with: 'No hay Insumos cargadados en el sistema' ];
		ifFalse: [ html unorderedList
					class: 'row';
					with: [ self model administrador insumos
							do: [ :insumo | 
								html listItem
									class: 'card col-sm-3 bg-white border-warning mx-4 my-4';
									with: [ html render: (InsumoSelector of: insumo andParent: self) ] ] ] ]
]
