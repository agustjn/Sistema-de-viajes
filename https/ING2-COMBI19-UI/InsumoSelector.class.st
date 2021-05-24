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
	html div
		with: [ html div
				class: '';
				with: [ html div
						class: 'card-body';
						with: [ html heading level5
								class: 'card-header text-center border-secondary';
								with: 'Insumo'.
							html paragraph
								class: 'card-text';
								with: [ html strong: 'Nombre de producto: ' ; text: insumo nombre.
									html break.
									html strong:'Marca: ' ; text: insumo marca.
									html break.
									html strong:'Precio: ' ; text: insumo precio] ] ] ].
	html space.
	self renderizarBotonesABMOn: html.
	"html render: advertiseView."
	
	
"	html
		text:
			'Insumo: ' , insumo nombre , ' - Marca: ' , insumo marca
				, ' - Precio: $' , insumo precio asString.
	html space. self renderizarBotonesABMOn: html"
]

{ #category : #'as yet unclassified' }
InsumoSelector >> renderizarBotonesABMOn: html [
	html div
		class: 'text-center';
		with: [ html anchor
				callback: [ self parent call: (InsumoEditorView newOf: insumo) ];
				with: [ html submitButton
						class: 'btn btn-warning';
						with: 'Editar' ].
			html space.
			html anchor
				callback: [ self eliminarInsumo.
					self answer ];
				with: [ html submitButton
						class: 'btn btn-danger';
						with: 'Eliminar' ].
			html break ; break. ]
]
