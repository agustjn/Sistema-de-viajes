Class {
	#name : #RutaCreationView,
	#superclass : #WAComponent,
	#instVars : [
		'parent',
		'origen',
		'destino',
		'hora',
		'combi',
		'distancia'
	],
	#category : #'ING2-COMBI19-UI-Rutas-CRUD-UI'
}

{ #category : #'instance creation' }
RutaCreationView class >> newWithParent: aParent [
	^ self new parent: aParent
]

{ #category : #accessing }
RutaCreationView >> combi [ ^combi
]

{ #category : #accessing }
RutaCreationView >> combi: aCombi [ 
	combi := aCombi
]

{ #category : #accessing }
RutaCreationView >> destino [ ^destino
]

{ #category : #accessing }
RutaCreationView >> destino: aDestino [
	destino:= aDestino
]

{ #category : #accessing }
RutaCreationView >> distancia [ ^distancia
]

{ #category : #accessing }
RutaCreationView >> distancia: aDistancia [
	 distancia := aDistancia 
]

{ #category : #'as yet unclassified' }
RutaCreationView >> guardarRuta [
	self model administrador
		agregarRuta: self origen
		destino: self destino
		horario: self hora
		combi: self combi
		distancia: self distancia
]

{ #category : #accessing }
RutaCreationView >> hora [ ^hora
]

{ #category : #accessing }
RutaCreationView >> hora: aHora [
	hora := aHora
]

{ #category : #accessing }
RutaCreationView >> model [ 
	^ Combi19 soleInstance 
]

{ #category : #accessing }
RutaCreationView >> origen [ ^origen
]

{ #category : #accessing }
RutaCreationView >> origen: aOrigen [
	origen := aOrigen
]

{ #category : #accessing }
RutaCreationView >> parent [ ^parent
]

{ #category : #accessing }
RutaCreationView >> parent: aParent [
	parent := aParent
]

{ #category : #rendering }
RutaCreationView >> renderContentOn: html [
	html heading level2 with: 'Creacion de una nueva ruta'.
	html horizontalRule.
	html
		form: [ self renderizarFormularioOn: html.
			html break.
			html submitButton
				callback: [ self guardarRuta.
					self parent activarRutasView  ];
				value: 'Guardar'.
			html space.
			html space.
			html submitButton
				callback: [ self parent desactivarRutaCreationView ];
				with: 'Cancelar' ]
]

{ #category : #rendering }
RutaCreationView >> renderizarFormularioOn: html [
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
