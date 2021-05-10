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

{ #category : #accessing }
InsumoSelector >> insumo [
	^ insumo
]

{ #category : #accessing }
InsumoSelector >> insumo: anObject [
	insumo := anObject
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
	
	html text:'Insumo: ', insumo nombre , ' - Marca: ' , insumo marca , ' - Precio: $' , (insumo precio) asString. 
	html space.
	"self renderizarBotonesABMOn: html."
]
