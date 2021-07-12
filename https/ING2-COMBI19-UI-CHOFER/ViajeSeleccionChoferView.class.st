Class {
	#name : #ViajeSeleccionChoferView,
	#superclass : #WAComponent,
	#instVars : [
		'viaje',
		'parent',
		'filtro',
		'txt'
	],
	#category : #'ING2-COMBI19-UI-CHOFER-viajes-UI'
}

{ #category : #'instance creation' }
ViajeSeleccionChoferView class >> newWithParent: aParent delViaje: unViaje [ 
	^ self new
		parent: aParent;
		viaje: unViaje;
		yourself
]

{ #category : #'instance creation' }
ViajeSeleccionChoferView class >> newWithParent: aParent delViaje: unViaje conFiltro: unFiltro [
	^ self new
		parent: aParent;
		viaje: unViaje;
		filtro: unFiltro;
		yourself
]

{ #category : #event }
ViajeSeleccionChoferView >> cancelar [
	| msj |
	msj := GenericAdvertiseView
		newWithParent: self
		heading: '¿Esta seguro que desea cancelar el viaje?'
		item1: nil
		item2: nil
		item3: nil.
	self parent
		activarConfirmacion: (ConfirmacionView newWith: msj parent: self parent viaje: self viaje)
]

{ #category : #accessing }
ViajeSeleccionChoferView >> filtro: unFiltro [
	filtro:= unFiltro 
]

{ #category : #'as yet unclassified' }
ViajeSeleccionChoferView >> finalizar [
	self viaje estado: 'Realizado'
]

{ #category : #accessing }
ViajeSeleccionChoferView >> model [
	^ Combi19 soleInstance 
]

{ #category : #'as yet unclassified' }
ViajeSeleccionChoferView >> mostrarDetalles: html [
	self parent parent desactivarViajesChoferView.
	self parent parent activarDetallesViajeView: self viaje
	"self
		call: (DetallesViajeView newWith: self viaje parent: self parent parent)"
]

{ #category : #accessing }
ViajeSeleccionChoferView >> parent [
	^ parent
]

{ #category : #accessing }
ViajeSeleccionChoferView >> parent: anObject [
	parent := anObject
]

{ #category : #rendering }
ViajeSeleccionChoferView >> renderContentOn: html [
	filtro ifNil: [ txt := 'Proximo viaje' ] ifNotNil: [ txt := 'Viaje' ].
	html div
		with: [ html div
				class: '';
				with: [ html div
						class: 'card-body';
						with: [ html heading level5
								class: 'card-header text-center border-warning';
								with: txt.
							html paragraph
								class: 'card-text text-center';
								with: [ html unorderedList
										class: 'col-md-12';
										with: [ self renderizarItems: html ] ] ].
					html space.
					
					filtro = 'Pendiente'
						ifTrue: [ self renderizarBotonCancelar: html.
							self renderizarBotonVer: html. ].
					filtro = 'Iniciado' ifTrue:[ self renderizarBotonFinalizar:html].
					
					filtro ifNil: [ self renderizarBotonCancelar: html ] ] ]
]

{ #category : #rendering }
ViajeSeleccionChoferView >> renderizarBotonCancelar: html [
	html div
		class: 'text-center';
		with: [ html anchor
				callback: [ self cancelar ];
				with: [ html submitButton
						class: 'btn btn-dark';
						with: 'Cancelar' ] ].
	html space
]

{ #category : #rendering }
ViajeSeleccionChoferView >> renderizarBotonFinalizar: html [
	html div
		class: 'text-center';
		with: [ html anchor
				callback: [ self finalizar ];
				with: [ html submitButton
						class: 'btn btn-outline-dark btn-lg ';
						with: '  Finalizar  '  ] ].
	html space
]

{ #category : #'as yet unclassified' }
ViajeSeleccionChoferView >> renderizarBotonVer: html [
	html div
		class: 'text-center';
		with: [ html anchor
				callback: [ self mostrarDetalles: html  ];
				with: [ html submitButton
						class: 'btn btn-outline-info';
						with: '  Ver detalles  ' ] ].
	html space.
	html break
]

{ #category : #rendering }
ViajeSeleccionChoferView >> renderizarItems: html [

	html div
		class: 'col-md-12 text-center';
		with: [ ""
			html heading level5
				class: ' my-4';
				with: viaje ruta string.
			html heading level5
				class: ' my-4';
				with:
					'Fecha: ' , viaje fecha asString , ' a las '
						, viaje ruta horario asString.
			html heading level5
				class: ' my-4';
				with: 'Chofer: ' , viaje ruta combi stringChofer.
			html heading level6
				class: ' my-4';
				with: 'Estado: ' , viaje estado.
			html heading level6
				class: ' my-4';
				with: 'Asientos disponibles: ' , viaje cantAsientosDisponibles asString ]
]

{ #category : #accessing }
ViajeSeleccionChoferView >> viaje [
	^ viaje
]

{ #category : #accessing }
ViajeSeleccionChoferView >> viaje: anObject [
	viaje := anObject
]
