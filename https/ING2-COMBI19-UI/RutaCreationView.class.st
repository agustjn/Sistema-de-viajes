Class {
	#name : #RutaCreationView,
	#superclass : #WAComponent,
	#instVars : [
		'parent',
		'origen',
		'destino',
		'combi',
		'distancia',
		'advertencia',
		'horario',
		'rangoHorario'
	],
	#category : #'ING2-COMBI19-UI-Rutas-CRUD-UI'
}

{ #category : #'instance creation' }
RutaCreationView class >> newWithParent: aParent [
	^ self new parent: aParent
]

{ #category : #accessing }
RutaCreationView >> advertencia [
	^advertencia 
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

{ #category : #formatting }
RutaCreationView >> formatearHorario [
	^ (horario , ' ' , rangoHorario) asTime
]

{ #category : #event }
RutaCreationView >> guardarRuta [

	| origenObj destinoObj |
		self halt.
	origenObj := self model administrador buscarLugar: self origen.
	destinoObj := self model administrador buscarLugar: self destino.
	(self model administrador
		agregarRuta: origenObj
		destino: destinoObj
		combi: (self model administrador buscarCombi:(self combi))
		distancia: self distancia
		horario: self formatearHorario)
		ifTrue: [ self parent activarRutasView ]
		ifFalse: [ self renderAdvertencia ]
]

{ #category : #accessing }
RutaCreationView >> horario [
	^ horario
]

{ #category : #accessing }
RutaCreationView >> horario: anObject [
	horario := anObject
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

{ #category : #accessing }
RutaCreationView >> rangoHorario [
	^ rangoHorario
]

{ #category : #accessing }
RutaCreationView >> rangoHorario: anObject [
	rangoHorario := anObject
]

{ #category : #rendering }
RutaCreationView >> renderAdvertencia [
	advertencia := GenericAdvertiseView
		newWithParent: self
		heading: 'Ruta existente '
		item1: 'No se puede agregar la ruta '
		item2: 'La ruta   desde ' , origen , ' hasta ' , destino , ' ya existe '
		item3: nil
]

{ #category : #rendering }
RutaCreationView >> renderAdvertencia: ruta [
	advertencia := GenericAdvertiseView
		newWithParent: self
		heading: 'No se puede agregar ruta '
		item1: 'La ruta  ' , ruta string , ' ya existe '
		item2: nil
		item3: nil
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
	advertencia ifNotNil: [ html render: advertencia ]
]

{ #category : #rendering }
RutaCreationView >> renderizarFormularioOn: html [
html space.
			html break.
			html text: 'Localidad de origen '.
			html space.
			(html select on: #origen of: self)
				list: self model administrador lugaresNombres.
			html
				break;
				break.
			html text: 'Localidad de destino'.
			html space.
			(html select on: #destino of: self)
				list: self model administrador lugaresNombres.
			html
				break;
				break.
			html text: 'Seleccionar la combi'.
			html space.
			(html select on: #combi of: self)
				list: self model administrador combisNombres.
			html
				break;
				break.
			html space.
			html text: 'Ingrese la distancia '.
			html space.
			(html textInput on: #distancia of: self) placeholder:'En KM' ; size:4.
			html break ; break. html space.
			html text: 'Horario'.
			html space.
			(html textInput on: #horario of: self)
				size: 1;
				maxLength: 2.
			html space.
			(html select on: #rangoHorario of: self) list: #(#PM 'AM') .
			html break.
]
