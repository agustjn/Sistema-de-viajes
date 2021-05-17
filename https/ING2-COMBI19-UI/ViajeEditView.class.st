Class {
	#name : #ViajeEditView,
	#superclass : #WAComponent,
	#instVars : [
		'parent',
		'viaje',
		'ruta',
		'horario',
		'fecha',
		'hora',
		'precio'
	],
	#category : #'ING2-COMBI19-UI-Viaje-CRUD-UI'
}

{ #category : #'instance creation' }
ViajeEditView class >> newOf: aViaje [
	self new viaje: aViaje
]

{ #category : #accessing }
ViajeEditView >> fecha [ ^fecha
]

{ #category : #accessing }
ViajeEditView >> fecha: aFecha [ 	
	fecha:= aFecha
]

{ #category : #'as yet unclassified' }
ViajeEditView >> guardarViaje [
self halt.
	self model administrador
		agregarViajeConRuta: self ruta
		fecha: self fecha
		hora: self hora
		precio: self precio
]

{ #category : #accessing }
ViajeEditView >> hora [ ^hora
]

{ #category : #accessing }
ViajeEditView >> hora: aHora [
	hora := aHora
]

{ #category : #accessing }
ViajeEditView >> model [
 ^Combi19 soleInstance 
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
			self renderizarBotonesOn: html ]
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
	html select
		list: (self model administrador rutasNombre);
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

{ #category : #accessing }
ViajeEditView >> ruta [ ^ruta
]

{ #category : #accessing }
ViajeEditView >> ruta: aRuta [
	ruta := ruta
]

{ #category : #accessing }
ViajeEditView >> viaje [ ^viaje
]

{ #category : #accessing }
ViajeEditView >> viaje: aViaje [
	viaje:= aViaje
]
