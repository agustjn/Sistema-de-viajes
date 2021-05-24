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
										with: [ self renderizarItems: html. ] ] ] ] ].
	html space.
	self renderizarBotonesABMOn: html


	"	html
		text:
			'Ruta desde  ' , ruta origen string , '    hasta  '
				, ruta destino string , '    combi ' , ruta combi string
				, '    distancia: ' , ruta distancia , 'km'.
	html space.
	self renderizarBotonesABMOn: html.
	html render: advertiseView "
]

{ #category : #'as yet unclassified' }
RutaSelector >> renderizarBotonesABMOn: html [
	html div
		class: 'text-center';
		with: [ html anchor
				callback: [ self parent call: (RutaEditorView newOf: ruta) ];
				with: [ html submitButton class:'btn btn-dark'; with: 'Editar' ].
			html space.
			html anchor
				callback: [ self eliminarRuta.
					self answer ];
				with: [ html submitButton class:'btn btn-dark'; with: 'Eliminar' ].
				html break ; break. ]
]

{ #category : #rendering }
RutaSelector >> renderizarItems: html [
	html listItem
		class: 'card col-sm-6 bg-info border-warning ratio ratio-4x3';
		with: [ html div class:'text-center' ; with:[html strong:'Origen'].
			html break.
			html render: (LugarSelector of: ruta origen withButtons: false) ].
	html listItem
		class: 'card col-sm-6 bg-info border-warning ratio ratio-1x1';
		with: [ html div class:'text-center' ; with:[html strong:'Destino'].
				 html break.
			html render: (LugarSelector of: ruta destino withButtons: false) ].
	html listItem
			class:'card col-sm-6 bg-info border-warning';
			with:[ html div class:'text-center' ; with:[html strong:'Combi encargada'] .
					 html render: (CombiSelector of:(ruta combi) withButtons:false)].
	html listItem
			class:'card col-sm-6 bg-info border-warning';
			with:[ html div class:'text-center' ; with:[html strong:'Organizacion'].
				html break.
					 html heading level4 class:''; 
					              with: 'Horario de salida: ' , ruta horario asString.
				    html break.
					 html heading level4 class:'';
					with: 'Distancia del viaje: ' , ruta distancia , ' KM'
					 ].
	
]

{ #category : #'as yet unclassified' }
RutaSelector >> ruta [
	^ruta
]
