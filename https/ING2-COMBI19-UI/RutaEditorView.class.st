Class {
	#name : #RutaEditorView,
	#superclass : #WAComponent,
	#instVars : [
		'ruta',
		'origen',
		'destino',
		'fecha',
		'hora',
		'combi',
		'distancia'
	],
	#category : #'ING2-COMBI19-UI-Rutas-CRUD-UI'
}

{ #category : #'instance creation' }
RutaEditorView class >> newOf: aRuta [
	^self new ruta: aRuta
]

{ #category : #accessing }
RutaEditorView >> combi [ ^combi
]

{ #category : #accessing }
RutaEditorView >> combi: aCombi [
	combi:= aCombi
]

{ #category : #accessing }
RutaEditorView >> destino [ 
	^destino
]

{ #category : #accessing }
RutaEditorView >> destino: aDestino [
	destino := aDestino
]

{ #category : #accessing }
RutaEditorView >> distancia [ ^distancia
]

{ #category : #accessing }
RutaEditorView >> distancia: aDistancia [
	distancia := aDistancia
]

{ #category : #accessing }
RutaEditorView >> fecha [ ^fecha
]

{ #category : #accessing }
RutaEditorView >> fecha: aFecha [ 
	fecha:= aFecha
]

{ #category : #'as yet unclassified' }
RutaEditorView >> guardarDatos [
	self ruta editarOrigen: self origen destino: self destino   horario: self hora   combi: self combi  distancia: self distancia
]

{ #category : #accessing }
RutaEditorView >> hora [ 	
	^hora
]

{ #category : #accessing }
RutaEditorView >> hora: aHora [
	hora := aHora
]

{ #category : #accessing }
RutaEditorView >> model [ 	
	^Combi19 soleInstance 
]

{ #category : #accessing }
RutaEditorView >> origen [ ^origen
]

{ #category : #accessing }
RutaEditorView >> origen: anOrigen [
	origen := anOrigen 
]

{ #category : #rendering }
RutaEditorView >> renderContentOn: html [
	html
		form: [ self renderizarCamposBasicosOn: html.
			html horizontalRule.
			self renderizarBotonesOn: html ]
]

{ #category : #rendering }
RutaEditorView >> renderizarAdvertencia: html [
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
RutaEditorView >> renderizarBotonesOn: html [
	html submitButton
		callback: [ self guardarDatos.
			self answer ];
		value: 'Confirmar!'.
	html space.
	html submitButton
		callback: [ self answer ];
		value: 'Cancelar'
]

{ #category : #rendering }
RutaEditorView >> renderizarCamposBasicosOn: html [
	html horizontalRule.
	html heading: 'Editar datos'.
	self renderizarAdvertencia: html.
	self renderizarCamposOn: html
]

{ #category : #rendering }
RutaEditorView >> renderizarCamposOn: html [
	html space.
	html break.
	html text: 'Localidad de origen '.
	html space.
	(html select on: #origen of: self)
		list: self model administrador lugaresNombres.
	html break.
	html text: 'Localidad de destino'.
	html space.
	(html select on: #destino of: self)
		list: self model administrador lugaresNombres.
	html break.
	html text: 'Seleccionar la combi'.
	html space.
	(html select on: #combi of: self)
		list: self model administrador combisNombresModelo.
	html break.
	html text: 'Ingrese un horario'.
	html space.
	html textInput on: #hora of: self.
	html space.
	html text: 'Ingrese la distancia '.
	html space.
	html textInput on: #distancia of: self
]

{ #category : #accessing }
RutaEditorView >> ruta [
	^ruta
]

{ #category : #accessing }
RutaEditorView >> ruta: aRuta [
	ruta := aRuta
]
