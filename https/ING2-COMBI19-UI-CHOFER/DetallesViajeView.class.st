Class {
	#name : #DetallesViajeView,
	#superclass : #WAComponent,
	#instVars : [
		'parent',
		'viaje',
		'pasajero'
	],
	#category : #'ING2-COMBI19-UI-CHOFER-viajes-UI'
}

{ #category : #'instance creation' }
DetallesViajeView class >> newWith: aViaje parent: aParent [
^ self new
		parent: aParent;
		viaje: aViaje;
		yourself
	
]

{ #category : #'as yet unclassified' }
DetallesViajeView >> ausente: html [
	| msj opc |
	msj := GenericAdvertiseView
		newWithParent: self
		heading: 'Confirme la operacion   '
		item1: 'Desea eliminar a  ' , pasajero string
		item2: 'Confirme o cancele la operacion'
		item3: nil.
	self halt.
	opc := html render: (ConfirmacionView newWith: msj parent: self)
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
DetallesViajeView >> pasajero [
	^pasajero
]

{ #category : #accessing }
DetallesViajeView >> pasajero: unPasajero [
	pasajero := unPasajero 
]

{ #category : #'as yet unclassified' }
DetallesViajeView >> pasajeros: html [
	"Si hay pasajeros muestra una lista con ellos, sino un strin 'No hay pasajeros"

	| pasajeros pasajerosNombres text |
	pasajeros := self viaje clientes.
	pasajeros
		ifEmpty: [ text := 'No hay clientes' ]
		ifNotEmpty: [ text := 'Elija un pasajero'.
			pasajerosNombres := pasajeros collect: [ :a | a string ] ].
	html div
		with: [ html div
				class: '';
				with: [ html div
						class: 'card-body';
						with: [ html heading level3
								class: 'card-header text-center border-warning';
								with: text.
							html paragraph
								class: 'card-text';
								with: [ html unorderedList
										class: '';
										with: [ html heading level4
												class: ' my-1 text-center';
												with: [ html select
														list: pasajerosNombres;
														callback: [ :value | self pasajero: value ] ] ].
									self renderizarBotones: html ] ] ] ]
]

{ #category : #accessing }
DetallesViajeView >> renderContentOn: html [
	html div
		with: [ html div
				class: '';
				with: [ html div
						class: 'card-body';
						with: [ html heading level3
								class: 'card-header text-center border-warning';
								with: 'Viaje'.
							html paragraph
								class: 'card-text';
								with: [ html unorderedList
										class: 'col-md-12';
										with: [ self renderizarItems: html ] ] ].
					html space.
					 ] ]
]

{ #category : #rendering }
DetallesViajeView >> renderizarBotones: html [
	html unorderedList
		class: 'nav justify-content-center nav-tabs my-0';
		with: [ html anchor
				class: 'nav-item ml-4 my-0 py-0';
				with: [ html submitButton
						class: 'btn btn-outline-success';
						callback: [ self halt ];
						with: 'Ingresar sintomas covid' ].
			html anchor
				class: 'nav-item ml-4';
				with: [ html submitButton
						class: 'btn btn-outline-secondary';
						callback: [ self halt ];
						with: 'Ausente' ] ].
	html unorderedList
		class: 'nav justify-content-center nav-tabs my-0';
		with: [ html anchor
				class: 'nav-item ml-4 my-4 ';
				with: [ html submitButton
						class: 'btn btn-primary btn-lg ';
						callback: [  ];
						with: 'Iniciar Viaje' ].
			html anchor
				class: 'nav-item ml-4 my-4 ';
				with: [ html submitButton
						class: 'btn btn-danger btn-lg ';
						callback: [ self halt ];
						with: 'Cancelar viaje' ] ]
]

{ #category : #rendering }
DetallesViajeView >> renderizarItems: html [
	html div
		class: 'col-md-12';
		with: [ ""
			html heading level2
				class: ' my-3 text-center';
				with: viaje ruta string.
			html heading level3
				class: ' my-3 text-center';
				with:
					'Fecha: ' , viaje fecha asString , ' a las '
						, viaje ruta horario asString.
			html heading level3
				class: ' my-3 text-center';
				with: 'Estado: ' , viaje estado.
			html heading level5
				class: ' my-3 text-center';
				with: 'Chofer: ' , viaje ruta combi stringChofer.
			html heading level5
				class: ' mt-3 pb-4 text-center';
				with: 'Asientos disponibles: ' , viaje cantAsientosDisponibles asString .
			self pasajeros: html]
]

{ #category : #accessing }
DetallesViajeView >> viaje [
	^ viaje
]

{ #category : #accessing }
DetallesViajeView >> viaje: aViaje [
	viaje:= aViaje.
]
