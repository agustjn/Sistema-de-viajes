Class {
	#name : #RutaCreationView,
	#superclass : #Object,
	#instVars : [
		'parent',
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

{ #category : #accessing }
RutaCreationView >> fecha [
	^fecha
]

{ #category : #accessing }
RutaCreationView >> fecha: aFecha [ 	
	fecha:= aFecha
]

{ #category : #'as yet unclassified' }
RutaCreationView >> guardarRuta [
	self ruta
		editarOrigen: self origen
		destino: self desitno
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
				callback: [ self guardarRuta ];
				value: 'Guardar'.
			html space.
			html space.
			html submitButton
				callback: [ self parent desactivarRutaCreationView ];
				with: 'Cancelar' ].
]

{ #category : #rendering }
RutaCreationView >> renderizarFormularioOn: html [
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
	(html textInput on: #hora of: self) .
	html text: 'Ingrese la distancia '.
	(html textInput on: #distancia of: self).
]
