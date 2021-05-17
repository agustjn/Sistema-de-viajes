Class {
	#name : #ViajeCreationView,
	#superclass : #WAComponent,
	#instVars : [
		'parent',
		'ruta',
		'fecha',
		'hora',
		'precio'
	],
	#category : #'ING2-COMBI19-UI-Viaje-CRUD-UI'
}

{ #category : #'instance creation' }
ViajeCreationView class >> newWithParent: aParent [
	^ self new parent: aParent
]

{ #category : #rendering }
ViajeCreationView >> fecha [ ^fecha

]

{ #category : #rendering }
ViajeCreationView >> fecha: aFecha [
	fecha:= aFecha
]

{ #category : #'as yet unclassified' }
ViajeCreationView >> guardarViaje [
	self model administrador
		agregarViajeConRuta: (self model administrador buscarRuta: self ruta)
		fecha: self fecha
		hora: self hora
		precio: self precio
]

{ #category : #rendering }
ViajeCreationView >> hora [ ^hora
]

{ #category : #rendering }
ViajeCreationView >> hora: aHora [
	hora := aHora
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

{ #category : #rendering }
ViajeCreationView >> renderContentOn: html [
	html heading level2 with: 'Creacion de nuevo Viaje'.
	html horizontalRule.
	html
		form: [ self renderizarFormularioOn: html.
			html break.
			html submitButton
				callback: [ self guardarViaje. self parent activarViajeView  ];
				value: 'Guardar'.
			html space.
			html space.
			html submitButton
				callback: [ self parent desactivarViajeCreationView ];
				with: 'Cancelar' ]
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
	html text: 'Horario del viaje '.
	html break.
	html textInput on: #hora of: self.
	html break.
	html text: 'Ingrese la fecha del viaje'.
	html dateInput on: #fecha of: self
]

{ #category : #rendering }
ViajeCreationView >> ruta [ ^ruta
]

{ #category : #rendering }
ViajeCreationView >> ruta: aRuta [
	ruta := aRuta
]
