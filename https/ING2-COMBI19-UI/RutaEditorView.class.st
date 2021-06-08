Class {
	#name : #RutaEditorView,
	#superclass : #WAComponent,
	#instVars : [
		'ruta',
		'origen',
		'destino',
		'fecha',
		'combi',
		'distancia',
		'advertencia',
		'horario',
		'rangoHorario'
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

{ #category : #formatting }
RutaEditorView >> formatearHorario [
	^ (horario , ' ' , rangoHorario) asTime
]

{ #category : #'as yet unclassified' }
RutaEditorView >> guardarDatos [
	self origen = self destino 
	ifTrue: [ self renderAdvertencia3  ]
	ifFalse: [ 
	self validarHorario
		ifTrue: [ (self model administrador
				editarRuta: self ruta
				origen: self origen
				destino: self destino
				combi: self combi
				distancia: self distancia
				horario: self formatearHorario)
				ifTrue: [ self answer ]
				ifFalse: [ self renderAdvertencia ] ]]
]

{ #category : #accessing }
RutaEditorView >> horario [
	^ horario
]

{ #category : #accessing }
RutaEditorView >> horario: unHorario [
	horario := unHorario 
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

{ #category : #accessing }
RutaEditorView >> rangoHorario [
	^ rangoHorario 
]

{ #category : #accessing }
RutaEditorView >> rangoHorario: anObject [
	rangoHorario := anObject
]

{ #category : #rendering }
RutaEditorView >> renderAdvertencia [
	advertencia := GenericAdvertiseView
		newWithParent: self
		heading: 'Error al editar, ruta existente '
		item1: 'La ruta   desde ' , origen , ' hasta ' , destino
		item2: 'Con combi: ' , combi
		item3: 'a las ' , self horario , ' ' , self rangoHorario , ' ya existe'
]

{ #category : #rendering }
RutaEditorView >> renderAdvertencia2 [
	advertencia := GenericAdvertiseView
		newWithParent: self
		heading: 'Error al editar, Ingrese un horario '
		item1: 'Ingrese un horario dentro de los parametros'
		item2: ' Minimo 1 maximo 12 '
		item3:  nil
]

{ #category : #rendering }
RutaEditorView >> renderAdvertencia3 [
	advertencia := GenericAdvertiseView
		newWithParent: self
		heading: 'Error al Crear '
		item1: 'El origen y el destino deben ser distintos'
		item2: ' origen:  ' , self origen , ' destino: ' , self destino
		item3: nil
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
		callback: [ self guardarDatos ];
		value: 'Confirmar!'.
	html space.
	html submitButton
		callback: [ self answer ];
		value: 'Cancelar'.
	advertencia ifNotNil: [ html render: advertencia  ]
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
		list: self model administrador lugaresNombres;
		selected: self ruta origen string.
	html
		break;
		break.
	html text: 'Localidad de destino'.
	html space.
	(html select on: #destino of: self)
		list: self model administrador lugaresNombres;
		selected: self ruta destino string.
	html
		break;
		break.
	html text: 'Seleccionar la combi'.
	html space.
	(html select on: #combi of: self)
		list: self model administrador combisNombres;
		selected: self ruta combi string.
	html
		break;
		break.
	html text: 'Ingrese la distancia '.
	html space.
	(html textInput on: #distancia of: self)
		placeholder: ruta distancia , ' KM '.
	html text: ''.
	html break.
	html space.
	html text: 'Horario'.
	html space.
	(html textInput on: #horario of: self)
		size: 1;
		maxLength: 2.
	html space.
	(html select on: #rangoHorario of: self) list: #(#PM 'AM').
	html break
]

{ #category : #accessing }
RutaEditorView >> ruta [
	^ruta
]

{ #category : #accessing }
RutaEditorView >> ruta: aRuta [
	ruta := aRuta
]

{ #category : #'as yet unclassified' }
RutaEditorView >> validarHorario [

	self horario
		ifEmpty: [ self renderAdvertencia2.
			^ false ]
		ifNotEmpty: [((self horario asInteger) between: 1 and: 12)
				ifTrue: [ ^ true ]
				ifFalse: [ self renderAdvertencia2.
					^ false ] ]
]
