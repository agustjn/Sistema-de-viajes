Class {
	#name : #CombiEditorView,
	#superclass : #WAComponent,
	#instVars : [
		'modelo',
		'cantidadAsientos',
		'tipo',
		'patente',
		'combi',
		'chofer',
		'choferName',
		'advertiseView'
	],
	#category : #'ING2-COMBI19-UI-Combi-CRUD-UI'
}

{ #category : #'instance creation' }
CombiEditorView class >> newOf: aCombi [
	^ (self new) combi: aCombi
]

{ #category : #accessing }
CombiEditorView >> cantidad [
	^cantidadAsientos 
	
]

{ #category : #accessing }
CombiEditorView >> cantidad: unaCantidad [
	cantidadAsientos := unaCantidad 
]

{ #category : #accessing }
CombiEditorView >> choferName [ 
	^choferName 
]

{ #category : #accessing }
CombiEditorView >> choferName: aName [
	choferName:= aName 
]

{ #category : #accessing }
CombiEditorView >> choferes [
	| choferes |
	choferes := OrderedCollection new.
	choferes addAll: self model choferesDisponibles.
	choferes add: combi chofer nombre.
	^ choferes
]

{ #category : #accessing }
CombiEditorView >> combi [
	^combi
]

{ #category : #accessing }
CombiEditorView >> combi: unaCombi [	
	combi:= unaCombi
]

{ #category : #'as yet unclassified' }
CombiEditorView >> editarCombi [
	"Pregunta si  el chofer"
	(self model administrador existeCombi: self patente)
		ifTrue: [ self
				renderAdvertencia: 'La patente ' , self patente , ' ya esta registrada' ]
		ifFalse: [ self combi
				editarModelo: self modelo
				cantidadAsientos: self cantidad
				tipo: self tipo
				patente: self patente
				chofer: (self model buscarChoferNombre: choferName) ]
]

{ #category : #accessing }
CombiEditorView >> model [
	^ Combi19 soleInstance
]

{ #category : #accessing }
CombiEditorView >> modelo [
	^modelo
]

{ #category : #accessing }
CombiEditorView >> modelo: aModelo [
	modelo:= aModelo
]

{ #category : #accessing }
CombiEditorView >> patente [ 	^patente
	
]

{ #category : #accessing }
CombiEditorView >> patente: aPatente [
	patente:= aPatente 
]

{ #category : #rendering }
CombiEditorView >> renderAdvertencia: text [
	advertiseView := GenericAdvertiseView
		newWithParent: self heading: 'Error en la carga de combi' item1: text  item2: nil item3:nil  
		
		
		
		
		
	


]

{ #category : #rendering }
CombiEditorView >> renderContentOn: html [
	html
		form:
			[ self renderizarCamposBasicosOn: html.
			html horizontalRule.
			self renderizarBotonesOn: html ].
		 html
		render: advertiseView
]

{ #category : #rendering }
CombiEditorView >> renderizarAdvertencia: html [
	html
		div: [ html heading level2 with: 'Aviso'.
			html
				unorderedList: [ html
						listItem: 'Los campos que no se quieran modificar, se deben dejar vacios.'.
					html
						listItem:
							'Los caracteres en transparente indican los datos previos a la edicion.' ] ]
]

{ #category : #rendering }
CombiEditorView >> renderizarBotonesOn: html [
	html submitButton
		callback: [ self editarCombi. self answer ];
		value: 'Confirmar!'.
	html space.
	html submitButton
		callback: [ self answer ];
		value: 'Cancelar'
]

{ #category : #rendering }
CombiEditorView >> renderizarCamposBasicosOn: html [
	html horizontalRule.
	html heading: 'Editar datos'.
	self renderizarAdvertencia: html.
	self renderizarCamposOn: html
]

{ #category : #rendering }
CombiEditorView >> renderizarCamposOn: html [
	html space.
	html break.
	html text: 'Modelo'.
	html break.
	(html textInput on: #modelo of: self) placeholder: combi modelo.
	html break.
	html text: 'Patente '.
	html break.
	(html textInput on: #patente of: self) placeholder: combi patente.
	html break.
	html text: 'Cantidad de asientos '.
	html break.
	(html textInput on: #cantidad of: self)
		placeholder: combi cantidadDeAsientos.
	html break.
	html text: 'Tipo de asiento'.
	html break.
	(html textInput on: #tipo of: self) placeholder: combi tipo.
	html break.
	html text: 'Ingrese el chofer'.
	html break.
	(html select on: #choferName of: self)
		list: self choferes;
		selected: combi chofer nombre
]

{ #category : #accessing }
CombiEditorView >> tipo [ 
	^tipo
]

{ #category : #accessing }
CombiEditorView >> tipo: aTipo [
	tipo:= aTipo 
]
