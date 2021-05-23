Class {
	#name : #InsumoSelector,
	#superclass : #WAComponent,
	#instVars : [
		'parent',
		'insumo'
	],
	#category : #'ING2-COMBI19-UI-Insumo-CRUD-UI'
}

{ #category : #'instance initialization' }
InsumoSelector class >> of:anInsumo andParent: aParent [
	^ self new 
					parent: aParent ;
					insumo: anInsumo ;
					yourself
]

{ #category : #'as yet unclassified' }
InsumoSelector >> eliminarInsumo [
	self model administrador eliminarInsumo: self insumo
]

{ #category : #accessing }
InsumoSelector >> insumo [
	^ insumo
]

{ #category : #accessing }
InsumoSelector >> insumo: anObject [
	insumo := anObject
]

{ #category : #accessing }
InsumoSelector >> model [
	^ Combi19 soleInstance 
]

{ #category : #accessing }
InsumoSelector >> parent [
	^ parent
]

{ #category : #accessing }
InsumoSelector >> parent: anObject [
	parent := anObject
]

{ #category : #rendering }
InsumoSelector >> renderContentOn: html [
	html
		text:
			'Insumo: ' , insumo nombre , ' - Marca: ' , insumo marca
				, ' - Precio: $' , insumo precio asString.
	html space. self renderizarBotonesABMOn: html
]

{ #category : #'as yet unclassified' }
InsumoSelector >> renderizarBotonesABMOn: html [
	html anchor
		callback: [ self parent call: (InsumoEditorView newOf: insumo) ];
		with: [ html submitButton with: 'Editar' ].
	html space.
	html anchor
		callback: [ self eliminarInsumo.
			self answer ];
		with: [ html submitButton with: 'Eliminar' ]
]
