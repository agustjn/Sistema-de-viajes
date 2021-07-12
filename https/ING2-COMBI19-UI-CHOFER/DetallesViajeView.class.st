Class {
	#name : #DetallesViajeView,
	#superclass : #WAComponent,
	#instVars : [
		'parent',
		'viaje',
		'pasajeros',
		'ausenteConfirmacionView',
		'msj'
	],
	#category : #'ING2-COMBI19-UI-CHOFER-viajes-UI'
}

{ #category : #'instance creation' }
DetallesViajeView class >> newWith: unViaje parent: aParent [
	^ self new
		parent: aParent;
		viaje: unViaje;
		yourself
]

{ #category : #'as yet unclassified' }
DetallesViajeView >> activarMensaje: unMsj [
	msj := GenericAdvertiseView
		newWithParent: self
		heading: unMsj
		item1: nil
		item2: nil
		item3: nil
]

{ #category : #'as yet unclassified' }
DetallesViajeView >> cancelarViaje [
	"Le cancela el viaje al chofer y luego le avisa al administrador que haga todo para avisar el cancelamiento del viaje y setear el estado del viaje en cancelado"

	self model administrador cancelarViaje: self viaje.
	self parent 
		activarMensajeExito: 'Se cancelo exitosamente el viaje'
]

{ #category : #event }
DetallesViajeView >> confirmacionAusentismoMsj: unMensaje deUnPasajero: unPasajero [
	ausenteConfirmacionView := (ConfirmacionView newWith: unMensaje parent: self deUnPasajero: unPasajero).
	
	
]

{ #category : #event }
DetallesViajeView >> desactivarConfirmacionView [
	ausenteConfirmacionView := nil.
]

{ #category : #'as yet unclassified' }
DetallesViajeView >> iniciarViaje [
	self viaje pasajerosParaSubir
		ifEmpty: [ self viaje estado: 'Iniciado'.
			self parent activarMensajeExito: 'El viaje fue iniciado' ]
		ifNotEmpty: [ self
				activarMensaje:
					'Debe registrar los sintomas o marcar como ausentes a todos los pasajeros' ]
]

{ #category : #accessing }
DetallesViajeView >> model [ 	
	^Combi19 soleInstance 
]

{ #category : #accessing }
DetallesViajeView >> parent [
	^parent
]

{ #category : #accessing }
DetallesViajeView >> parent: aParent [
	parent:= aParent
]

{ #category : #accessing }
DetallesViajeView >> pasajeros [
	^pasajeros
]

{ #category : #accessing }
DetallesViajeView >> renderContentOn: html [
	html heading level4 with: 'Detalles del viaje '.
	html heading level3
		class: 'text-center ';
		with: self viaje ruta string.
	html heading level3
		class: 'text-center ';
		with: self viaje fecha.
	html horizontalRule.
	html render: msj.
	html horizontalRule.
	html anchor
		callback: [ self iniciarViaje ];
		with: [ html submitButton
				class: 'btn btn-primary mx-4 my-4';
				with: 'Iniciar Viaje' ].
	html anchor
		callback: [ self cancelarViaje ];
		with: [ html submitButton
				class: 'btn btn-danger mx-4 my-4';
				with: 'Cancelar viaje' ].
	html anchor
		callback: [ self venderNuevoBoleto ];
		with: [ html submitButton
				class: 'btn btn-warning mx-4 my-4';
				with: 'Vender nuevo boleto' ].
	html render: ausenteConfirmacionView.
	self renderizarPasajeros: html
]

{ #category : #'as yet unclassified' }
DetallesViajeView >> renderizarPasajeros: html [
	pasajeros := self viaje pasajerosParaSubir.
	self pasajeros
		ifEmpty: [ html heading level3 with: 'No hay pasajeros para el micro' ];
		ifNotEmpty: [ html unorderedList
				class: 'row';
				with: [ self pasajeros
						do: [ :unPasajero | 
							html listItem
								class: 'card col-sm-3 bg-white border-warning mx-4 my-4';
								with: [ html render: (PasajeroSelector of: unPasajero andParent: self) ] ] ] ]
]

{ #category : #event }
DetallesViajeView >> venderNuevoBoleto [
	self call:(VenderBoletoView newWithParent: self parent delViaje: viaje)
	
]

{ #category : #accessing }
DetallesViajeView >> viaje [
	^ viaje
]

{ #category : #accessing }
DetallesViajeView >> viaje: aViaje [
	viaje:= aViaje.
]
