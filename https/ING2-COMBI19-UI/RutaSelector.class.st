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
RutaSelector >> advertencia1 [
	^ (GenericAdvertiseView
		newWithParent: self
		heading: 'Error al eliminar Ruta'
		item1:
			'La ruta ' , self ruta string
				, ' no se puede eliminar por esta a un viaje asociado '
		item2: nil
		item3: nil)
]

{ #category : #'as yet unclassified' }
RutaSelector >> eliminarRuta [
	(self model administrador eliminarRuta: self ruta)
		ifTrue:  [ self parent advertencia:  nil ]
		ifFalse: [ self parent advertencia:  self advertencia1 ]
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
	html div
		with: [ html div
				class: '';
				with: [ html div
						class: 'card-body';
						with: [ html heading level5
								class: 'card-header text-center border-secondary';
								with: 'Ruta'.
							html paragraph
								class: 'card-text';
								with: [ html unorderedList
										class: 'row';
										with: [ self renderizarItems: html ] ] ] ] ].
	html space.
	self renderizarBotonesABMOn: html.

]

{ #category : #'as yet unclassified' }
RutaSelector >> renderizarBotonesABMOn: html [
	html div
		class: 'text-center';
		with: [ html anchor
				callback: [ self parent call: (RutaEditorView newOf: ruta) ];
				with: [ html submitButton class:'btn btn-warning'; with: 'Editar' ].
			html space.
			html anchor
				callback: [ self eliminarRuta.
					self answer ];
				with: [ html submitButton class:'btn btn-danger'; with: 'Eliminar' ].
				html break ; break. ]
]

{ #category : #rendering }
RutaSelector >> renderizarItems: html [
	html div 
  class:'col-md-12';
	with:[
	html heading level6 class:' my-4'; 
		with: 'Horario de salida: ' , ruta horario asString.
	html heading level6 class:' my-4';
					with: 'Distancia del viaje: ' , ruta distancia , ' KM'.
	html heading level6 class:' my-4';
					with: 'Origen: ' , ruta origen string.
	html heading level6 class:' my-4';
					with: 'Destino: ' , ruta destino string.
	html heading level6 class:' my-4';
					with: 'Combi: ' , ruta combi string.
	html heading level6 class:' my-4';
					with: 'Chofer: ' , ruta combi stringChofer].
]

{ #category : #'as yet unclassified' }
RutaSelector >> ruta [
	^ruta
]
