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

{ #category : #rendering }
ViajeCreationView >> fecha [ ^fecha

]

{ #category : #rendering }
ViajeCreationView >> fecha: aFecha [
	fecha:= aFecha
]

{ #category : #event }
ViajeCreationView >> guardarViaje: unaCantidad [ 
	"self cantAsientos
		ifEmpty: [ self cantAsientos: self rutaObj combi cantidadAsientos ]."
	(self model administrador
		validarViajeRuta: self rutaObj
		fecha: self fecha
		precio: self precio
		asientos: unaCantidad )
		ifTrue: [ self parent desactivarViajeCreationView ]
		ifFalse:
			[ "Si el viaje es invalido, se retorna false, de lo contrario se agrega al sistema y retorna true" self renderizarError ]
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
					html render: formCantidadAsientos.
					html break.
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
	formCantidadAsientos isNil "Verifico si el formulario de los asientos ya se renderizo"
		ifTrue: [ self rutaObj: (self model administrador buscarRuta: self ruta).
			formCantidadAsientos := FormularioCantidadAsientos
				con: self rutaObj ]
		ifFalse:[ "Valido los campos vacios" 
					  precio := InputField newWithStrategy: EmptyValidator andContent: precio.
					  precio esValido
								ifTrue:[ self guardarViaje: formCantidadAsientos cantAsientos.
											"self parent desactivarViajeCreationView" ]  ]

	"	| cantidad |
	
	self precio
		ifEmpty: [ self advertenciaCampoVacio.
			self answer ]
		ifNotEmpty: [ cantidad := html
				render: (FormularioCantidadAsientos con: self rutaObj) ].
	cantidad
		ifNil: [ self parent desactivarViajeCreationView ]
		ifNotNil: [ self guardarViaje: cantidad ]"
]
