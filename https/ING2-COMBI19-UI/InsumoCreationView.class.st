Class {
	#name : #InsumoCreationView,
	#superclass : #WAComponent,
	#instVars : [
		'parent',
		'insumo',
		'advertiseView'
	],
	#category : #'ING2-COMBI19-UI-Insumo-CRUD-UI'
}

{ #category : #'instance creation' }
InsumoCreationView class >> newWithParent: aParent [
 ^self new 
		parent: aParent;
		insumo:Insumo new.
]

{ #category : #event }
InsumoCreationView >> guardarInsumo [
	(self model administrador agregarInsumo: insumo)
		ifFalse:[ advertiseView := GenericAdvertiseView newWithParent: self 
																	  heading:'Error al agregar insumo'  
																	  item1:'El nombre y marca de producto son identicos a otro producto existente en el sistema'  
																	  item2:nil  item3:nil   ]
		ifTrue:[ self parent desactivarInsumoCreationView  ]
]

{ #category : #accessing }
InsumoCreationView >> insumo [
	^ insumo
]

{ #category : #accessing }
InsumoCreationView >> insumo: anObject [
	insumo := anObject
]

{ #category : #accessing }
InsumoCreationView >> model [
	^Combi19 soleInstance
]

{ #category : #accessing }
InsumoCreationView >> parent [
	^ parent
]

{ #category : #accessing }
InsumoCreationView >> parent: anObject [
	parent := anObject
]

{ #category : #rendering }
InsumoCreationView >> renderContentOn: html [
	html heading level2 with:'Creacion de nuevo insumo'.
	html horizontalRule.
	html form:[ self renderizarFormularioOn: html.
					html break.
						html submitButton
							callback: [ self guardarInsumo ];
							value: 'Guardar'.
					html space. 
					html space.
					html submitButton
								callback:[ self parent desactivarInsumoCreationView ];
								with:'Cancelar' .
					].
	html render:advertiseView.
]

{ #category : #rendering }
InsumoCreationView >> renderizarFormularioOn: html [
	html text:'Nombre del producto'.
	html break.
	html textInput on:#nombre of:self insumo.
	html break.
	html text:'Marca del producto'.
	html break.
	html textInput on:#marca of:self insumo.
	html break.
	html text:'Precio del producto'.
	html break.
	html textInput on:#precio of:self insumo.
	html break.
	
]
