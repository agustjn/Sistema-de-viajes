Class {
	#name : #ConfirmacionView,
	#superclass : #WAComponent,
	#instVars : [
		'parent',
		'msj',
		'pasajero',
		'viaje'
	],
	#category : #'ING2-COMBI19-UI-CHOFER-viajes-UI'
}

{ #category : #'instance creation' }
ConfirmacionView class >> newWith: unMsj parent: aParent [
	^ self new
		parent: aParent;
		msj: unMsj;
		yourself
]

{ #category : #'instance creation' }
ConfirmacionView class >> newWith: unMsj parent: aParent deUnPasajero: unPasajero [
	^ self new
		parent: aParent;
		msj: unMsj;
		pasajero: unPasajero ;
		yourself
]

{ #category : #'instance creation' }
ConfirmacionView class >> newWith: unMsj parent: aParent viaje: unViaje [
	^ self new
		parent: aParent;
		msj: unMsj;
		viaje: unViaje ;yourself
]

{ #category : #'as yet unclassified' }
ConfirmacionView >> confirmar [

	self parent viaje marcarComoAusenteA: pasajero.
	self parent desactivarConfirmacionView.
	self parent
		activarMensaje: 'Se confirmo el ausentismo de ' ,pasajero string
]

{ #category : #'as yet unclassified' }
ConfirmacionView >> confirmoCancelacion [
self model administrador cancelarViaje: self viaje.
	self parent parent
		activarMensajeExito: 'Se cancelo exitosamente el viaje'
]

{ #category : #accessing }
ConfirmacionView >> model [
	^ Combi19 soleInstance 
]

{ #category : #accessing }
ConfirmacionView >> msj [
	^ msj
]

{ #category : #accessing }
ConfirmacionView >> msj: unMensaje [
	msj:= unMensaje
]

{ #category : #accessing }
ConfirmacionView >> parent [
	^parent 
]

{ #category : #accessing }
ConfirmacionView >> parent: aParent [
	parent:= aParent
]

{ #category : #accessing }
ConfirmacionView >> pasajero [
	^ pasajero
]

{ #category : #accessing }
ConfirmacionView >> pasajero: anObject [
	pasajero := anObject
]

{ #category : #rendering }
ConfirmacionView >> renderContentOn: html [
	html render: msj.
	self renderizarBotones: html
]

{ #category : #'as yet unclassified' }
ConfirmacionView >> renderizarBotonAusentismo: html [
html unorderedList
		class: 'text-center my-0';
		with: [ html anchor
				callback: [ self confirmar ];
				with: [ html submitButton
						class: 'btn btn-success';
						with: 'Confirmar ausentismo' ].
			html anchor
				callback: [ self parent desactivarConfirmacionView ];
				with: [ html submitButton
						class: 'btn btn-outline-danger';
						with: 'Cancelar ausentismo ' ] ]
]

{ #category : #'as yet unclassified' }
ConfirmacionView >> renderizarBotonCancelacion: html [
	html unorderedList
		class: 'text-center my-0';
		with: [ html anchor
				callback: [ self confirmoCancelacion ];
				with: [ html submitButton
						class: 'btn btn-success mx-4 btn-lg';
						with: 'Confirmo' ].
			html anchor
				callback: [ self parent desactivarConfirmacionView ];
				with: [ html submitButton
						class: 'btn btn-outline-danger mx-4 btn-lg';
						with: 'Deniego' ] ]
]

{ #category : #accessing }
ConfirmacionView >> renderizarBotones: html [
	self viaje
		ifNil: [  self renderizarBotonAusentismo: html ]
		ifNotNil: [self renderizarBotonCancelacion: html] 
]

{ #category : #accessing }
ConfirmacionView >> viaje [
	^ viaje
]

{ #category : #accessing }
ConfirmacionView >> viaje: unViaje [
	viaje:= unViaje 
]
