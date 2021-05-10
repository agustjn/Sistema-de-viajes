Class {
	#name : #RutaEditorView,
	#superclass : #Object,
	#instVars : [
		'ruta',
		'origen',
		'destino',
		'fecha',
		'hora',
		'combi',
		'distancia'
	],
	#category : #'ING2-COMBI19-UI-Rutas-UI'
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
RutaEditorView >> desitno [ ^destino
]

{ #category : #accessing }
RutaEditorView >> desitno: aDestino [
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
	self ruta editarOrigen: self origen destino: self desitno   horario: self hora   combi: self combi  distancia: self distancia
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
	html break.
	(html select on: #origen of: self)
		list: self model administrador lugares.
	html break.
	html text: 'Localidad de destino'.
	(html select on: #destino of: self)
		list: self model administrador lugares.
	html break.
	html text: 'Seleccionar la combi'.
	(html select on: #combi of: self)
		list: self model administrador combis.
	html break.
	html text: 'Fecha del viaje '.
	html dateInput on: #fecha of: self.
	 html text: 'Ingrese un horario'.
	(html textInput on: #hora of: self) placeholder: ruta horario.
	html text: 'Ingrese la distancia '.
	(html textInput on: #distancia of: self) placeholder: ruta distancia
]

{ #category : #accessing }
RutaEditorView >> ruta [
	^ruta
]