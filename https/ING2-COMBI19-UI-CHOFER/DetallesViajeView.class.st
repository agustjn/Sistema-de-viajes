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

{ #category : #accessing }
DetallesViajeView >> ausente: html [
	| msj opc |
	msj := GenericAdvertiseView
		newWithParent: self
		heading: 'Confirme la operacion   '
		item1: 'Desea eliminar a  ' , self pasajero 
		item2: 'Confirme o cancele la operacion'
		item3: nil.

	opc := html render: (ConfirmacionView newWith: msj parent: self).

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

{ #category : #accessing }
DetallesViajeView >> pasajeros: html [
	| pasajeros pasajerosNombres text |
	pasajeros := self viaje clientes.
	pasajeros
		ifEmpty: [ text := 'No hay pasajeros' ]
		ifNotEmpty: [ text := 'Elija un pasajero'.
			pasajerosNombres := pasajeros collect: [ :a | a string ] ].
	html div
		class: 'card-body';
		with: [ html heading level3
				class: 'card-header text-center border-warning';
				with: text.
			html paragraph
				class: 'card-text';
				with: [ html heading level4
						class: ' my-1 text-center';
						with: [ html select
								list: pasajerosNombres;
								callback: [ :value | self pasajero: value ] ] ] ].

]

{ #category : #accessing }
DetallesViajeView >> renderContentOn: html [
html div
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
										with: [ self renderizarItems: html ] ] ] ].
			self renderizarBotones: html 
]

{ #category : #rendering }
DetallesViajeView >> renderizarBotones: html [
	html unorderedList
		class: 'text-center my-0';
		with: [ html anchor
				callback: [ 
					self ausente: html ];
				with: [ html submitButton
						class: 'btn btn-outline-success mx-4';
						with: 'Ingresar sintomas covid' ].
			html anchor
				callback: [ self halt.self ausente: html ];
				with: [ html submitButton
						class: 'btn btn-outline-danger mx-4';
						with: '  Ausente   ' ] ].
	html
		break;
		break;
		break;
		horizontalRule.
	html unorderedList
		class: 'text-center my-2';
		with: [ html anchor
				callback: [ self ausente: html ];
				with: [ html submitButton
						class: 'btn btn-primary btn-lg';
						with: 'Iniciar viaje' ] ].
	html unorderedList
		class: 'text-center my-2 mx-8 px-8 ';
		with: [ html anchor
				callback: [ self ausente: html ];
				with: [ html submitButton
						class: 'btn btn-danger btn-lg';
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
