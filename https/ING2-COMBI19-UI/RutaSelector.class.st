Class {
	#name : #RutaSelector,
	#superclass : #WAComponent,
	#instVars : [
		'ruta',
		'parent',
		'advertiseView'
	],
	#category : #'ING2-COMBI19-UI-Rutas-CRUD-UI'
}

{ #category : #'instance creation' }
RutaSelector class >> of: aRuta andParent: aParent [
	^ self new inicializeCon: aRuta parent: aParent 
]

{ #category : #'as yet unclassified' }
RutaSelector >> eliminarRuta [
	(self model administrador eliminarRuta: self ruta) ifFalse: [  advertiseView := GenericAdvertiseView
				newWithParent: self
				heading: 'Error al eliminar Ruta'
				item1: 'La ruta ', self ruta string, ' no se puede eliminar por esta a un viaje asociado '
				item2: nil
				item3: nil  ]
]

{ #category : #'as yet unclassified' }
RutaSelector >> inicializeCon: aRuta parent: aParent [
	ruta := aRuta.
	parent := aParent.
	advertiseView  := nil.
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
			'Ruta desde  ' , ruta origen string , '    hasta  '
				, ruta destino string , '    combi ' , ruta combi string
				, '    distancia: ' , ruta distancia , 'km'.
	html space.
	self renderizarBotonesABMOn: html.
	html render: advertiseView 
]

{ #category : #'as yet unclassified' }
RutaSelector >> renderizarBotonesABMOn: html [
	html anchor
		callback: [ self parent call: (RutaEditorView newOf: ruta) ];
		with: [ html submitButton with: 'Editar' ].
	html space.
	html anchor
		callback: [ self eliminarRuta.
			self answer ];
		with: [ html submitButton with: 'Eliminar' ]
]

{ #category : #'as yet unclassified' }
RutaSelector >> ruta [
	^ruta
]
