Class {
	#name : #ViajeSeleccionChoferView,
	#superclass : #WAComponent,
	#instVars : [
		'viaje',
		'parent',
		'filtro'
	],
	#category : #'ING2-COMBI19-UI-CHOFER-Principals-UI'
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

{ #category : #accessing }
ViajeSeleccionChoferView >> filtro: unFiltro [
	filtro:= unFiltro 
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
					filtro ifNil: [  self renderizarBotones: html]
					 ] ]
]

{ #category : #rendering }
ViajeSeleccionChoferView >> renderizarBotones: html [
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
ViajeSeleccionChoferView >> renderizarItems: html [
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
ViajeSeleccionChoferView >> viaje [
	^ viaje
]

{ #category : #accessing }
ViajeSeleccionChoferView >> viaje: anObject [
	viaje := anObject
]
