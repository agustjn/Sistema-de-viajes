Class {
	#name : #PagarViajeBasicoView,
	#superclass : #WAComponent,
	#instVars : [
		'reserva',
		'cardPayView',
		'parent',
		'errorView',
		'monto'
	],
	#category : #'ING2-COMBI19-UI-CLIENTE-Viajes-UI'
}

{ #category : #deprecated }
PagarViajeBasicoView class >> deReserva: unaReserva conParent: aParent [
	^ self new reserva: unaReserva	;
				  parent: aParent ;
				  yourself 
]

{ #category : #'as yet unclassified' }
PagarViajeBasicoView class >> deReserva: unaReserva conParent: aParent conMonto: unMonto [
	^ self new reserva: unaReserva	;
				  parent: aParent ;
				  monto: unMonto ;
				  yourself 
]

{ #category : #event }
PagarViajeBasicoView >> activarMensajeExito [
	self session user agregarViaje: reserva viaje.
	reserva viaje agregarCliente: self session user.
	self parent parent parent
		activarMensajeExito: 'La reserva del viaje se hizo exitosamente'
]

{ #category : #accessing }
PagarViajeBasicoView >> cardPayView [
	^ cardPayView
]

{ #category : #accessing }
PagarViajeBasicoView >> cardPayView: anObject [
	cardPayView := anObject
]

{ #category : #event }
PagarViajeBasicoView >> finalizarCompra [
	self session user agregarViaje: reserva viaje.
	reserva viaje agregarCliente: self session user.
	self parent parent parent
		activarMensajeExito: 'La reserva del viaje se hizo exitosamente'.
]

{ #category : #accessing }
PagarViajeBasicoView >> monto [
	^ monto
]

{ #category : #accessing }
PagarViajeBasicoView >> monto: anObject [
	monto := anObject
]

{ #category : #accessing }
PagarViajeBasicoView >> parent [
	^ parent
]

{ #category : #accessing }
PagarViajeBasicoView >> parent: anObject [
	parent := anObject
]

{ #category : #rendering }
PagarViajeBasicoView >> renderContentOn: html [
		html div class:'text-center';
				with:[ html heading level3 with:'Compra de pasaje' ].
	html break.
	html strong:'Viaje con Ruta ', reserva viaje ruta string.
	html break.
	html strong:'Fecha del viaje: ', reserva viaje fecha asString.
	html break;break.
	html strong:'Total a pagar: $' , monto asString.
	html break ; break.
	html render:errorView.
	html render:cardPayView.
	cardPayView := (CardPayComponent newWithParent: self ofClient:( self session user )).
	
	
]

{ #category : #rendering }
PagarViajeBasicoView >> renderizarError: unString [
	errorView := GenericAdvertiseView
		newWithParent: self
		heading: 'Error en la validacion de la tarjeta'
		item1: unString
		item2: nil
		item3: nil
]

{ #category : #accessing }
PagarViajeBasicoView >> reserva [
	^ reserva
]

{ #category : #accessing }
PagarViajeBasicoView >> reserva: anObject [
	reserva := anObject
]
