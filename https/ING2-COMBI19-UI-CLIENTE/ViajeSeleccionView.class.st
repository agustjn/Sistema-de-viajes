Class {
	#name : #ViajeSeleccionView,
	#superclass : #WAComponent,
	#instVars : [
		'viaje',
		'parent',
		'filtro'
	],
	#category : #'ING2-COMBI19-UI-CLIENTE-Viajes-UI'
}

{ #category : #'instance creation' }
ViajeSeleccionView class >> newWithParent: aParent delViaje: unViaje [ 
	^ self new
		parent: aParent;
		viaje: unViaje;
		yourself
]

{ #category : #'instance creation' }
ViajeSeleccionView class >> newWithParent: aParent delViaje: unViaje conFiltro: unFiltro [
	^ self new
		parent: aParent;
		viaje: unViaje;
		filtro: unFiltro;
		yourself
]

{ #category : #event }
ViajeSeleccionView >> calcularPorcentajeDeDevolucion [
	( self viaje fecha subtractDate: (Date today)) > 2 
			ifTrue:[ ^ '100%' ]
			ifFalse:[	^'50%']
]

{ #category : #'as yet unclassified' }
ViajeSeleccionView >> eliminar [
	| auxtemp |
	auxtemp := self session user viajes.
	"Agregar reglas de negocio"
	
	self session user eliminarElViaje: self viaje.
	self viaje eliminarCliente: self session user.
	self viaje sumarAsientos: ( ( (self session user) buscarReservaDelViaje: (self viaje) ) cupos ) .
	self parent parent activarMensajeExito: 'Se cancelo el viaje correctamente y se le reintegro el ', self calcularPorcentajeDeDevolucion, ' del valor del mismo'
]

{ #category : #accessing }
ViajeSeleccionView >> filtro: unFiltro [
	filtro:= unFiltro 
]

{ #category : #accessing }
ViajeSeleccionView >> parent [
	^ parent
]

{ #category : #accessing }
ViajeSeleccionView >> parent: anObject [
	parent := anObject
]

{ #category : #rendering }
ViajeSeleccionView >> renderContentOn: html [
	html div
		with: [ html div
				class: '';
				with: [ html div
						class: 'card-body';
						with: [ html heading level5
								class: 'card-header text-center border-warning';
								with: 'Viaje'.
							html paragraph
								class: 'card-text';
								with: [ html unorderedList
										class: 'col-md-12';
										with: [ self renderizarItems: html ] ] ].
					html space.
					filtro ifNil: [ self renderizarBotones: html ] 
					ifNotNil: [ filtro = 'Pendiente' ifTrue: [
							self renderizarBotonElimnar: html ] ] ]]
]

{ #category : #rendering }
ViajeSeleccionView >> renderizarBotonElimnar: html [
	html div
		class: 'text-center';
		with: [ html anchor
				callback: [ self eliminar ];
				with: [ html submitButton
						class: 'btn btn-dark';
						with: 'Cancelar' ] ].
	html space

]

{ #category : #rendering }
ViajeSeleccionView >> renderizarBotones: html [
	html div
		class: 'text-center';
		with: [ html anchor
				callback: [ self parent call: (ViajeCompraView newDelViaje: viaje conParent:self) ];
				with: [ html submitButton class:'btn btn-dark'; with: 'Comprar pasajes' ] ].
			html space.
			"html anchor
				callback: [  ];
				with: [ html submitButton class:'btn btn-danger'; with: 'Eliminar' ].
				html break ; break. ]"
]

{ #category : #rendering }
ViajeSeleccionView >> renderizarItems: html [
	html div
		class: 'col-md-12';
		with: [ ""
			html heading level6
				class: ' my-4';
				with: viaje ruta string.
			html heading level6
				class: ' my-4';
				with:
					'Fecha: ' , viaje fecha asString , ' a las '
						, viaje ruta horario asString.
			html heading level6
				class: ' my-4';
				with: 'Chofer: ' , viaje ruta combi stringChofer.
			html heading level6
				class: ' my-4';
				with: 'Estado: ' , viaje estado.
			html heading level6
				class: ' my-4';
				with: 'Asientos disponibles: ' , (viaje cantAsientosDisponibles) asString   ]
]

{ #category : #accessing }
ViajeSeleccionView >> viaje [
	^ viaje
]

{ #category : #accessing }
ViajeSeleccionView >> viaje: anObject [
	viaje := anObject
]
