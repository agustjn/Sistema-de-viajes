Class {
	#name : #InformeDeCompraView,
	#superclass : #WAComponent,
	#instVars : [
		'monto',
		'tarjeta',
		'parent'
	],
	#category : #'ING2-COMBI19-UI-CLIENTE-Viajes-UI'
}

{ #category : #'as yet unclassified' }
InformeDeCompraView class >> conMonto: unTotal yTarjeta: unaTarjeta [
	^ self new monto: unTotal ; tarjeta: unaTarjeta ; yourself
]

{ #category : #'as yet unclassified' }
InformeDeCompraView class >> conMonto: unTotal yTarjeta: unaTarjeta conParent: unParent [
	^ self new monto: unTotal ; tarjeta: unaTarjeta ; parent: unParent ; yourself
]

{ #category : #event }
InformeDeCompraView >> finalizarCompra [
	(self parent parent parent) activarMensajeExito:'La reserva se ha hecho exitosamente!'.
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
			html strong: 'Datos de la tarjeta a utilizar'.
			html break ; break.
			html label: 'Numero de tarjeta: ' , tarjeta nro.
			html break.
			html label: 'Codigo de seguridad: ' , tarjeta codSeguridad.
			html break.
			html label: 'Fecha de vencimiento: ' , tarjeta fechaVencimientoStr.
			html horizontalRule.
			self renderizarBotones:html ]
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

{ #category : #accessing }
InformeDeCompraView >> tarjeta [
	^ tarjeta
]

{ #category : #accessing }
InformeDeCompraView >> tarjeta: anObject [
	tarjeta := anObject
]
