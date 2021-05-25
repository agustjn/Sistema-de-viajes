Class {
	#name : #ViajeEditView,
	#superclass : #WAComponent,
	#instVars : [
		'parent',
		'viaje',
		'ruta',
		'fecha',
		'precio',
		'advertiseView',
		'cantidad'
	],
	#category : #'ING2-COMBI19-UI-Viaje-CRUD-UI'
}

{ #category : #'instance creation' }
ViajeEditView class >> newOf: aViaje [
	^ self new viaje: aViaje
]

{ #category : #event }
ViajeEditView >> advertencia: title con: text [ 
advertiseView := GenericAdvertiseView
				newWithParent: self
				heading: title
				item1: text
				item2: nil
				item3: nil 
]

{ #category : #accessing }
ViajeEditView >> advertiseView [
	^ advertiseView
]

{ #category : #accessing }
ViajeEditView >> advertiseView: anObject [
	advertiseView := anObject
]

{ #category : #accessing }
ViajeEditView >> cantAsientos [ 
	^ cantidad
]

{ #category : #accessing }
ViajeEditView >> cantAsientos: unaCantidad [
	cantidad := unaCantidad
]

{ #category : #accessing }
ViajeEditView >> fecha [ ^fecha
]

{ #category : #accessing }
ViajeEditView >> fecha: aFecha [ 	
	fecha:= aFecha
]

{ #category : #event }
ViajeEditView >> guardarViaje [

	(self model administrador
		editarViaje: self viaje
		conRuta: (self model administrador buscarRuta: self ruta)
		fecha: self fecha
		precio: self precio
		asientos: self cantAsientos)
		ifFalse: [ self
				advertencia: 'Error al querer editar'
				con: 'El viaje ingresado ya existe' ]
]

{ #category : #accessing }
ViajeEditView >> model [
 ^Combi19 soleInstance 
]

{ #category : #accessing }
ViajeEditView >> parent [
	^ parent
]

{ #category : #accessing }
ViajeEditView >> parent: anObject [
	parent := anObject
]

{ #category : #accessing }
ViajeEditView >> precio [ ^precio
]

{ #category : #accessing }
ViajeEditView >> precio: aPrecio [
	precio := aPrecio
]

{ #category : #rendering }
ViajeEditView >> renderContentOn: html [

	html
		form: [ self renderizarCamposBasicosOn: html.
			html horizontalRule.
			self renderizarBotonesOn: html ].
	advertiseView ifNotNil: [ html render: advertiseView ]
]

{ #category : #rendering }
ViajeEditView >> renderizarAdvertencia: html [
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
ViajeEditView >> renderizarBotonesOn: html [
	html submitButton
		callback: [ self guardarViaje.
			self answer ];
		value: 'Confirmar!'.
	html space.
	html submitButton
		callback: [ self answer ];
		value: 'Cancelar'
]

{ #category : #rendering }
ViajeEditView >> renderizarCamposBasicosOn: html [
	html horizontalRule.
	html heading: 'Editar datos'.
	"self renderizarAdvertencia: html."
	self renderizarCamposOn: html
]

{ #category : #rendering }
ViajeEditView >> renderizarCamposOn: html [
	html heading level4 with: 'Seleccione la ruta del viaje'.
	(html select on: #ruta of: self)
		list: self model administrador rutasNombre;
		selected: ruta.
	html break.
	html text: 'Precio del boleto'.
	html break.
	(html textInput on: #precio of: self) placeholder: self viaje precio.
	html break.
	html text: 'Ingrese la fecha del viaje'.
	html break.
	html dateInput on: #fecha of: self.
	html
		text: 'Cantidad de asientos disponibles';
		break.
	(html textInput on: #cantAsientos of: self)
		placeholder: self viaje ruta combi cantidadAsientos;
		size: 2
]

{ #category : #accessing }
ViajeEditView >> ruta [
	^ ruta
]

{ #category : #accessing }
ViajeEditView >> ruta: anObject [
	ruta := anObject
]

{ #category : #accessing }
ViajeEditView >> viaje [ ^viaje
]

{ #category : #accessing }
ViajeEditView >> viaje: aViaje [
	viaje:= aViaje
]
