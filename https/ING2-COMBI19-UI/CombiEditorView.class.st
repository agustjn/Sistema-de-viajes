Class {
	#name : #CombiEditorView,
	#superclass : #WAComponent,
	#instVars : [
		'modelo',
		'cantidadAsientos',
		'tipo',
		'patente',
		'combi',
		'chofer'
	],
	#category : #'ING2-COMBI19-UI-Combi-UI'
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
CombiEditorView >> choferesDisponibles [
	^ self model choferesDisponibles collect: [ :chofer | chofer nombre ]
]

{ #category : #accessing }
CombiEditorView >> combi [
	^combi
]

{ #category : #accessing }
CombiEditorView >> combi: unaCombi [	
	combi:= unaCombi
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
CombiEditorView >> renderContentOn: html [
	html
		form: [ self renderizarCamposBasicosOn: html.
			html horizontalRule.
			self renderizarBotonesOn: html ]
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
		callback: [ self combi editarModelo: self modelo cantidadAsientos: self cantidad  tipo: self tipo  patente: self patente .
			self answer ];
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
	html select
		list: self choferesDisponibles;
		selected: (self choferesDisponibles at: 2)
]

{ #category : #accessing }
CombiEditorView >> tipo [ 
	^tipo
]

{ #category : #accessing }
CombiEditorView >> tipo: aTipo [
	tipo:= aTipo 
]
