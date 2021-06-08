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
	self distancia
		ifEmpty: [ self renderAdvertencia4 ]
		ifNotEmpty: [ origenObj := self model administrador buscarLugar: self origen.
			destinoObj := self model administrador buscarLugar: self destino.
			self destino = self origen
				ifTrue: [ self renderAdvertencia3 ]
				ifFalse: [ self validarHorario
						ifTrue: [ (self model administrador
								agregarRuta: origenObj
								destino: destinoObj
								combi: self combi
								distancia: self distancia
								horario: self formatearHorario)
								ifTrue: [ self parent activarRutasView ]
								ifFalse: [ self renderAdvertencia ] ] ] ]
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
		heading: 'Error al crear, ruta existente '
		item1: 'La ruta   desde ' , origen , ' hasta ' , destino
		item2: 'Con combi: ' , combi
		item3: 'a las ' , self horario , ' ' , self rangoHorario , ' ya existe'
]

{ #category : #rendering }
RutaCreationView >> renderAdvertencia2 [
	advertencia := GenericAdvertiseView
		newWithParent: self
		heading: 'Error al Crear, Ingrese un horario '
		item1: 'Ingrese un horario dentro de los parametros'
		item2: ' Minimo 1 maximo 12 '
		item3: nil
]

{ #category : #rendering }
RutaCreationView >> renderAdvertencia3 [
	advertencia := GenericAdvertiseView
		newWithParent: self
		heading: 'Error al Crear '
		item1: 'El origen y el destino deben ser distintos'
		item2: (' origen:  ' ,self origen , ' destino: ' , self destino)
		item3: nil
]

{ #category : #rendering }
RutaCreationView >> renderAdvertencia4 [
		advertencia := GenericAdvertiseView
		newWithParent: self
		heading: 'Error al Crear '
		item1: 'Se a detectado que ha dejado campos vacios'
		item2: ' Por favor complete todos los campos para seguir'
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

{ #category : #'as yet unclassified' }
RutaCreationView >> validarHorario [
	self horario
		ifEmpty: [ self renderAdvertencia2.
			^ false ]
		ifNotEmpty: [ (self horario asInteger between: 1 and: 12)
				ifTrue: [ ^ true ]
				ifFalse: [ self renderAdvertencia2.
					^ false ] ]
]
