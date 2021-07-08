Class {
	#name : #ViajeSeleccionView,
	#superclass : #WAComponent,
	#instVars : [
		'viaje',
		'parent'
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
	self renderizarBotones: html ] ]
]

{ #category : #rendering }
ViajeSeleccionView >> renderizarBotones: html [
	html div
		class: 'text-center';
		with: [ html anchor
				callback: [ self parent call: (ViajeCompraView newDelViaje: viaje) ];
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
