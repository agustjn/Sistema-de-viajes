Class {
	#name : #PasajeroSelector,
	#superclass : #WAComponent,
	#instVars : [
		'pasajero',
		'parent'
	],
	#category : #'ING2-COMBI19-UI-CHOFER-viajes-UI'
}

{ #category : #'instance creation' }
PasajeroSelector class >> of:unPasajero andParent: aParent [

	^ self new
		parent: aParent;
		pasajero: unPasajero;
		yourself
]

{ #category : #accessing }
PasajeroSelector >> ausente: html [
	| msj opc |
	msj := GenericAdvertiseView
		newWithParent: self
		heading: 'Confirme la operacion   '
		item1: 'Desea eliminar a  ' , (self pasajero string)
		item2: 'Confirme o cancele la operacion'
		item3: nil.
	self parent confirmacionAusentismoMsj:msj deUnPasajero: self pasajero.
	
]

{ #category : #'as yet unclassified' }
PasajeroSelector >> cargarFormularioSintomas: html [
	"	self parent parent desactivarDetallesViajeView ."

	self parent
		call: (FormularioCovidView newWith: pasajero parent: self parent viaje: self parent viaje )
]

{ #category : #accessing }
PasajeroSelector >> parent [
	^parent
]

{ #category : #accessing }
PasajeroSelector >> parent: aParent [
	parent := aParent
]

{ #category : #accessing }
PasajeroSelector >> pasajero [
	^pasajero
]

{ #category : #accessing }
PasajeroSelector >> pasajero: aPasajero [
	pasajero:= aPasajero
]

{ #category : #accessing }
PasajeroSelector >> renderContentOn: html [
	html div
		with: [ html div
				class: '';
				with: [ html div
						class: 'card-body';
						with: [ html heading level5
								class: 'card-header text-center border-secondary';
								with: 'Pasajero'.
							html paragraph
								class: 'card-text text-center';
								with: [ html
										strong: 'Nombre:  ';
										text: pasajero nombre.
									html break.
									html
										strong: 'Apellido:  ';
										text: pasajero apellido.
									html break.
									html
										strong: 'Email:   ';
										text: pasajero email ] ] ] ].
	html space.
	self renderizarBotonesOn: html
]

{ #category : #rendering }
PasajeroSelector >> renderizarBotonesOn: html [
	html div
		class: 'text-center';
		with: [ html anchor
				callback: [ self
						cargarFormularioSintomas: html. ];
				with: [ html submitButton
						class: 'btn btn-outline-success mb-2';
						with: 'Cargar sintomas covid' ].
			html space.
			html anchor
				callback: [ self ausente: html.  ];
				with: [ html submitButton
						class: 'btn btn-outline-danger';
						with: 'Ausente' ].
			html
				break;
				break ]
]
