Class {
	#name : #CombiView,
	#superclass : #WAComponent,
	#instVars : [
		'parent',
		'advertencia'
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
CombiView >> renderAdvertenciaFinish [
	advertencia := nil
]

{ #category : #rendering }
CombiView >> renderAdvertenciaNew [
	advertencia := GenericAdvertiseView
		newWithParent: self
		heading: 'Error al eliminar combi'
		item1: 'La combi seleccionada esta asignada a una ruta '
		item2: nil
		item3: nil
]

{ #category : #rendering }
CombiView >> renderContentOn: html [
	self parent desactivarCombiCreationView.
	html heading: 'Combis'.
	self renderizarCombisOn: html.
	html anchor
		callback: [ self parent activarCombiCreationView ];
		with: [ html submitButton with: 'Crear Combi' ].
	 advertencia ifNotNil: [ html render: advertencia ]
]

{ #category : #rendering }
CombiView >> renderizarCombisOn: html [
	self model administrador combis isEmpty
		ifTrue: [ html heading level4 with: 'No hay Combis cargadados en el sistema' ];
		ifFalse: [ html unorderedList
					class: 'row';
					with: [ self model administrador combis
							do: [ :combi | 								
								html listItem
									class: 'card col-sm-3 bg-info border-warning';
									with: [ html render: (CombiSelector of: combi andParent: self).
										 ] ] ] ]
]
