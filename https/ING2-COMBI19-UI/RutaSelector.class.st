Class {
	#name : #RutaSelector,
	#superclass : #WAComponent,
	#instVars : [
		'ruta',
		'parent'
	],
	#category : #'ING2-COMBI19-UI-Rutas-CRUD-UI'
}

{ #category : #'instance creation' }
RutaSelector class >> of: aRuta andParent: aParent [
	^ self new inicializeCon: aRuta parent: aParent 
]

{ #category : #'as yet unclassified' }
RutaSelector >> inicializeCon: aRuta parent: aParent [
	ruta := aRuta.
	parent :=aParent
]

{ #category : #'as yet unclassified' }
RutaSelector >> model [
	^ Combi19 soleInstance 
]

{ #category : #'as yet unclassified' }
RutaSelector >> parent [ 	
	^parent
]

{ #category : #rendering }
RutaSelector >> renderContentOn: html [
	html
		text:
			'Ruta desde  ' , ruta origen string , '    hasta  ' , ruta destino string
				, '    combi ' , ruta combi string , '    distancia: '
				, ruta distancia , 'km'.
	html space.
	self renderizarBotonesABMOn: html
]

{ #category : #'as yet unclassified' }
RutaSelector >> renderizarBotonesABMOn: html [
	html anchor
		callback: [ self parent call: (RutaEditorView newOf: ruta) ];
		with: [ html submitButton with: 'Editar' ].
	html space.
	html anchor
		callback: [ self model administrador eliminarRuta: self ruta.
			self answer ];
		with: [ html submitButton with: 'Eliminar' ]
]

{ #category : #'as yet unclassified' }
RutaSelector >> ruta [
	^ruta
]
