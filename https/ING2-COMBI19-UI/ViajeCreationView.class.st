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
		'rangoHorario'
	],
	#category : #'ING2-COMBI19-UI-Viaje-CRUD-UI'
}

{ #category : #'instance creation' }
ViajeCreationView class >> newWithParent: aParent [
	^ self new 
		parent: aParent.
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
ViajeCreationView >> guardarViaje [
|rutaObj|
"Recupero el obj ruta desde un string, y consulto si esta vacio la cantidad , de ser asi le seteo la por defecto y  guardo el viaje."
rutaObj  :=  self model administrador buscarRuta: self ruta.
 self cantAsientos ifEmpty: [ self cantAsientos: rutaObj cantidadAsientos   ].
	(self model administrador
		validarViajeRuta: rutaObj
		fecha: self fecha
		precio: self precio
		asientos: self cantAsientos)
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
ViajeCreationView >> precio [ ^precio
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
	html heading level2 with: 'Creacion de nuevo Viaje'.
	self renderizarAviso: html.
	html horizontalRule.
	html
		form: [ self renderizarFormularioOn: html.
			html break.
			html submitButton
				callback: [ self guardarViaje. ];
				value: 'Guardar'.
			html space.
			html space.
			html submitButton
				callback: [ self parent desactivarViajeCreationView ];
				with: 'Cancelar' ].
	html render: errorView.
	 
]

{ #category : #rendering }
ViajeCreationView >> renderizarAviso: html [
	html horizontalRule.
	html strong: 'Aviso' ; break.
	html text:'Si la cantidad de asientos disponibles se deja vacia, se asigna la capacidad maxima de la combi al viaje.' ; break.
]

{ #category : #rendering }
ViajeCreationView >> renderizarError [
	| cantidadAsientos |
	cantidadAsientos := (self model administrador buscarRuta: self ruta)
		combi cantidadAsientos.
	errorView := GenericAdvertiseView
		newWithParent: self
		heading:
			'Error al crear nuevo viaje debido a alguno de los siguientes motivos: '
		item1: 'Se repite la misma ruta y fecha que posee otro viaje creado'
		item2:
			'Se ingreso una cantidad de asientos que excede la capacidad de la combi'
		item3: 'La capacidad de la combi seleccionada es de:   ', 	(cantidadAsientos asString )
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
	html
		text: 'Cantidad de asientos disponibles';
		break.
	(html textInput on: #cantAsientos of: self)
		"placeholder: self placeholderAsientos;   QUERIA VER LA MANERA DE AGREGARLE UN MAXIMO"  
		size: 2.
	html break
]

{ #category : #rendering }
ViajeCreationView >> ruta [ ^ruta
]

{ #category : #rendering }
ViajeCreationView >> ruta: aRuta [
	ruta := aRuta
]
