Class {
	#name : #BuscarViajeClienteView,
	#superclass : #WAComponent,
	#instVars : [
		'parent',
		'errorView',
		'origenProvincia',
		'origenLocalidad',
		'destinoProvincia',
		'destinoLocalidad',
		'fecha'
	],
	#category : #'ING2-COMBI19-UI-CLIENTE-Viajes-UI'
}

{ #category : #'instance creation' }
BuscarViajeClienteView class >> newWithParent: aParent [
	^ self new parent: aParent
]

{ #category : #accessing }
BuscarViajeClienteView >> destinoLocalidad [
	^ destinoLocalidad 
]

{ #category : #accessing }
BuscarViajeClienteView >> destinoLocalidad: unDestino [
	destinoLocalidad:= unDestino 
]

{ #category : #accessing }
BuscarViajeClienteView >> destinoProvincia [
	^destinoProvincia 
]

{ #category : #accessing }
BuscarViajeClienteView >> destinoProvincia: unDestino [
	destinoProvincia:= unDestino 
]

{ #category : #accessing }
BuscarViajeClienteView >> fecha [
	 ^ fecha
]

{ #category : #accessing }
BuscarViajeClienteView >> fecha: unaFecha [
	fecha:= unaFecha
	
]

{ #category : #accessing }
BuscarViajeClienteView >> model [
	^ Combi19 soleInstance
]

{ #category : #accessing }
BuscarViajeClienteView >> origenLocalidad [
	^ origenLocalidad
]

{ #category : #accessing }
BuscarViajeClienteView >> origenLocalidad: unOrigen [
	origenLocalidad:= unOrigen 
]

{ #category : #accessing }
BuscarViajeClienteView >> origenProvincia [
	^ origenProvincia 
]

{ #category : #accessing }
BuscarViajeClienteView >> origenProvincia: unOrigen [
	origenProvincia:= unOrigen
]

{ #category : #accessing }
BuscarViajeClienteView >> parent [
	^parent
]

{ #category : #accessing }
BuscarViajeClienteView >> parent: aParent [ 
	parent:= aParent
]

{ #category : #accessing }
BuscarViajeClienteView >> renderContentOn: html [
	html div
		class: 'container';
		with: [ 
			html heading level2 with: 'Buscar viaje'.
			html break.
			html
				form: [ self renderizarFormulario: html.
						  self renderizarBotonesOn: html ] ]
]

{ #category : #rendering }
BuscarViajeClienteView >> renderizarBotonesOn: html [
	html break;break.
	html submitButton
						callback: [ self siguiente ];
						value: 'Siguiente'.
					html space.
					html space.
					html submitButton
						callback: [ self parent desactivarViajeView ];
						with: 'Cancelar'.
	html break ; break.
]

{ #category : #'as yet unclassified' }
BuscarViajeClienteView >> renderizarFormulario: html [
	html text: 'Origen provincia: '.
	html break.
	(html select on:#origenProvincia of:self) list:(self model provinciasArgentinas).
	html break.
	html text: 'Origen Localidad: '.
	html break.
	html textInput on:#origenLocalidad of:self.
	html break.
	html text: 'Destino Provincia '.
	html break.
	(html select on:#destinoProvincia of:self) list:(self model provinciasArgentinas).
	html break.
	html text: 'Destino Localidad'.
	html break.
	html textInput on: #destinoLocalidad of: self.
	html break. 
	html text: 'Ingrese la fecha del viaje'.
	html break.
	html dateInput on: #fecha of: self.
]

{ #category : #event }
BuscarViajeClienteView >> siguiente [
	| lugarOrigen lugarDestino|
	lugarOrigen := Lugar deProvincia: origenProvincia yLocalidad: origenLocalidad.
	lugarDestino := Lugar deProvincia: destinoProvincia yLocalidad: destinoLocalidad.
	(self model administrador buscarViajeDesde: lugarOrigen  hasta:lugarDestino  conFecha: fecha asDate)
	   ifNotNil:[ :viajes | self call: (SeleccionDeViajesView newOfViaje: viajes)]
		ifNil:[ self renderizarErrorViajesVacios ].
		
	
	
]
