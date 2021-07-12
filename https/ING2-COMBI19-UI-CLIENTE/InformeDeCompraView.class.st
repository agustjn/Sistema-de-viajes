Class {
	#name : #InformeDeCompraView,
	#superclass : #WAComponent,
	#instVars : [
		'monto',
		'tarjeta',
		'parent',
		'cardPayView',
		'reserva',
		'errorView'
	],
	#category : #'ING2-COMBI19-UI-CLIENTE-Viajes-UI'
}

{ #category : #'as yet unclassified' }
InformeDeCompraView class >> conMonto: unTotal yTarjeta: unaTarjeta conParent: unParent yReserva: unaReserva [
	^ self new monto: unTotal ; tarjeta: unaTarjeta ; parent: unParent ; reserva: unaReserva ;yourself
]

{ #category : #event }
InformeDeCompraView >> activarCardPayView [
	cardPayView := CardPayComponent newWithParent: self ofClient: (self session user)
]

{ #category : #event }
InformeDeCompraView >> finalizarCompra [
	self session user agregarViaje: reserva viaje.
	reserva viaje agregarCliente: self session user.
	self parent parent parent
		activarMensajeExito: 'La reserva del viaje se hizo exitosamente, con 10% descuento'
]

{ #category : #event }
InformeDeCompraView >> finalizarCompraConTarjetaExistente [
	self session user agregarViaje: reserva viaje.
	reserva viaje agregarCliente: self session user.
	self parent parent parent
		activarMensajeExito: 'La reserva se ha hecho exitosamente!, con 10% de descuento'
]

{ #category : #accessing }
InformeDeCompraView >> monto [
	^ monto
]

{ #category : #accessing }
InformeDeCompraView >> monto: anObject [
	monto := anObject
]

{ #category : #accessing }
InformeDeCompraView >> parent [
	^ parent
]

{ #category : #accessing }
InformeDeCompraView >> parent: anObject [
	parent := anObject
]

{ #category : #rendering }
InformeDeCompraView >> renderContentOn: html [
	html div
		class: 'text-center';
		with: [ html heading level2 with: 'Monto total a pagar: $' , monto asString.
			html horizontalRule.
			html strong: 'Datos de la tarjeta en su cuenta: '.
			html break ; break.
			html label: 'Numero de tarjeta: ' , tarjeta nro asString.
			html break.
			html label: 'Codigo de seguridad: ' , tarjeta codSeguridad.
			html break.
			html label: 'Fecha de vencimiento: ' , tarjeta fechaVencimientoStr asString.
			html horizontalRule.
			html render:errorView.
			html horizontalRule.
			html render: cardPayView .
			cardPayView ifNil:[ html form:[self renderizarOpciones: html] ] ]
]

{ #category : #rendering }
InformeDeCompraView >> renderizarBotones: html [
	html anchor 
				callback:[ self finalizarCompra ];
				with:[ html submitButton with:'Finalizar compra'].
	html anchor 
				callback:[ self answer];
				with:[ html submitButton with:'Cancelar'].
]

{ #category : #rendering }
InformeDeCompraView >> renderizarError: unString [
	errorView := GenericAdvertiseView
		newWithParent:self
		heading:'Error con los datos de la tarjeta ingresada'
		item1:unString
		item2: nil
		item3: nil
]

{ #category : #rendering }
InformeDeCompraView >> renderizarOpciones: html [
	html label:'¿Desea utilizar su tarjeta ya almacenada o ingresar una nueva?'; break.
	html submitButton class:'btn btn-dark';
							callback:[ self finalizarCompraConTarjetaExistente];
							with:'Usar mi tarjeta'.
	html space.
	html submitButton class:'btn btn-dark';
							callback:[ self activarCardPayView];
							with:'Ingresar una nueva'.
					
]

{ #category : #accessing }
InformeDeCompraView >> reserva [
	^ reserva
]

{ #category : #accessing }
InformeDeCompraView >> reserva: anObject [
	reserva := anObject
]

{ #category : #accessing }
InformeDeCompraView >> tarjeta [
	^ tarjeta
]

{ #category : #accessing }
InformeDeCompraView >> tarjeta: anObject [
	tarjeta := anObject
]
