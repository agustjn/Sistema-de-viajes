Class {
	#name : #ViajeCreationView,
	#superclass : #WAComponent,
	#instVars : [
		'parent',
		'ruta',
		'fecha',
		'precio',
		'cantAsientos',
		'errorView',
		'rangoHorario',
		'rutaObj',
		'formCantidadAsientos'
	],
	#category : #'ING2-COMBI19-UI-Viaje-CRUD-UI'
}

{ #category : #'instance creation' }
ViajeCreationView class >> newWithParent: aParent [
	^ self new 
		parent: aParent.
]

{ #category : #'as yet unclassified' }
ViajeCreationView >> advertenciaCampoVacio [
	errorView := GenericAdvertiseView
		newWithParent: self
		heading: 'Error al seguir   '
		item1: 'Por favor complete todos los campos '
		item2: nil
		item3: nil
]

{ #category : #'as yet unclassified' }
ViajeCreationView >> advertenciaCorrecta [
	GenericAdvertiseView
		newWithParent: self
		heading: 'Se agrego el viaje con exito   '
		item1: nil		item2: nil
		item3: nil
]

{ #category : #'as yet unclassified' }
ViajeCreationView >> advertenciaSinRuta [
	errorView := GenericAdvertiseView
		newWithParent: self
		heading:
			'No existen rutas creadas  '
		item1: 'Por favor cree una ruta para poder crear un viaje '
		item2: nil
		item3:nil
]

{ #category : #accessing }
ViajeCreationView >> cantAsientos [
	^ cantAsientos
]

{ #category : #accessing }
ViajeCreationView >> cantAsientos: anObject [
	cantAsientos := anObject
]

{ #category : #accessing }
ViajeCreationView >> cantidad [
	^ formCantidadAsientos cantAsientos
		ifNil: [  ^self rutaObj combi cantidadAsientos ]
]

{ #category : #rendering }
ViajeCreationView >> fecha [ ^fecha

]

{ #category : #rendering }
ViajeCreationView >> fecha: aFecha [
	fecha:= aFecha
]

{ #category : #event }
ViajeCreationView >> guardarViaje [
	"self cantAsientos
		ifEmpty: [ self cantAsientos: self rutaObj combi cantidadAsientos ]."

	| textAdvertencia |
	textAdvertencia := self model administrador
		validarViajeRuta: self rutaObj
		fecha: self fecha
		precio: self precio
		asientos: self cantidad.

	textAdvertencia
		ifNil: [ self parent activarMensajeExito: 'Se creo el viaje correctamente' ]
		ifNotNil: [ self renderizarError: textAdvertencia ]
]

{ #category : #rendering }
ViajeCreationView >> model [ 	
	^ Combi19 soleInstance 
]

{ #category : #accessing }
ViajeCreationView >> parent [ ^parent
]

{ #category : #accessing }
ViajeCreationView >> parent: aParent [
	parent := aParent
]

{ #category : #rendering }
ViajeCreationView >> precio [ 
	(InputField allInstances includes: precio)
		ifTrue:[ ^precio content ].
	^precio 
]

{ #category : #rendering }
ViajeCreationView >> precio: aPrecio [
	precio := aPrecio
]

{ #category : #accessing }
ViajeCreationView >> rangoHorario [
	^ rangoHorario
]

{ #category : #accessing }
ViajeCreationView >> rangoHorario: anObject [
	rangoHorario := anObject
]

{ #category : #rendering }
ViajeCreationView >> renderContentOn: html [
	self model administrador rutasNombre
		ifEmpty: [ self advertenciaSinRuta ]
		ifNotEmpty: [ html heading level2 with: 'Creacion de nuevo Viaje'.
			self renderizarAviso: html.
			html horizontalRule.
			html
				form: [ self renderizarFormularioOn: html.
					html break.
					html break.
					html render: formCantidadAsientos .
					html submitButton
						callback: [ self siguiente: html ];
						value: 'Siguiente'.
					html space.
					html space.
					html submitButton
						callback: [ self parent desactivarViajeCreationView ];
						with: 'Cancelar' ] ].
	html render: errorView
]

{ #category : #rendering }
ViajeCreationView >> renderizarAviso: html [
	html horizontalRule.
	html strong: 'Aviso' ; break.
	html text:'Si la cantidad de asientos disponibles se deja vacia, se asigna la capacidad maxima de la combi al viaje.' ; break.
]

{ #category : #rendering }
ViajeCreationView >> renderizarError [

	errorView := GenericAdvertiseView
		newWithParent: self
		heading:
			'Error al crear nuevo viaje debido a alguno de los siguientes motivos: '
		item1: 'Se repite la misma ruta y fecha que posee otro viaje creado'
		item2:
			'Se ingreso una cantidad de asientos que excede la capacidad de la combi'
		item3: 'No se completo el campo "Precio del boleto "'
]

{ #category : #rendering }
ViajeCreationView >> renderizarError: textAdvertencia [
	errorView := GenericAdvertiseView
		newWithParent: self
		heading:
			'Error al crear nuevo viaje debido al siguiente problema: '
		item1: textAdvertencia 
		item2:
			nil
		item3: nil
]

{ #category : #rendering }
ViajeCreationView >> renderizarFormularioOn: html [
	html heading level4 with: 'Seleccione la ruta del viaje'.
	html select
		list: self model administrador rutasNombre;
		callback: [ :value | self ruta: value ].
	html break.
	html text: 'Precio del boleto'.
	html break.
	html textInput on: #precio of: self.
	html break.
	html text: 'Ingrese la fecha del viaje'.
	html break.
	html dateInput on: #fecha of: self.
	html break.
	
]

{ #category : #rendering }
ViajeCreationView >> ruta [ ^ruta
]

{ #category : #rendering }
ViajeCreationView >> ruta: aRuta [
	ruta := aRuta
]

{ #category : #accessing }
ViajeCreationView >> rutaObj [
	^rutaObj 
]

{ #category : #accessing }
ViajeCreationView >> rutaObj: unaRuta [
	rutaObj := unaRuta
]

{ #category : #'as yet unclassified' }
ViajeCreationView >> siguiente: html [
	formCantidadAsientos
		ifNil: [ self rutaObj: (self model administrador buscarRuta: self ruta).
			formCantidadAsientos := FormularioCantidadAsientos
				con: self rutaObj ]
		ifNotNil: [ self precio
				ifEmpty: [ self advertenciaCampoVacio ]
				ifNotEmpty: [ self guardarViaje.
					 ] ]
]
