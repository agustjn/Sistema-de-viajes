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

{ #category : #rendering }
BuscarViajeClienteView >> renderContentOn: html [
	html render:errorView.
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
	html
		break;
		break.
	html submitButton
		callback: [ self siguiente ];
		class: 'btn btn-success';
		value: 'Siguiente'.
	html space.
	html space.
	html submitButton
		callback: [ self parent desactivarViajeView ];
		class: 'btn btn-danger';
		with: 'Cancelar'.
	html
		break;
		break
]

{ #category : #rendering }
BuscarViajeClienteView >> renderizarError:unString [
	errorView := GenericAdvertiseView newWithParent:self heading:unString  item1:nil  item2:nil   item3: nil 
]

{ #category : #rendering }
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
	| lugarOrigen lugarDestino res|
	lugarOrigen := Lugar
		deProvincia: origenProvincia
		yLocalidad: origenLocalidad.
	lugarDestino := Lugar
		deProvincia: destinoProvincia
		yLocalidad: destinoLocalidad.
	res := (self model administrador
		buscarViajeDesde: lugarOrigen
		hasta: lugarDestino
		conFecha: fecha asDate).
		
		res isString
		ifFalse:[ 
			self
				call: (SeleccionDeViajesView newOfViaje: res withParent: self parent) ]
		ifTrue:[ self renderizarError: res ]
		
]
