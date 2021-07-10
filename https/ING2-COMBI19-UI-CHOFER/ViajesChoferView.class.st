Class {
	#name : #ViajesChoferView,
	#superclass : #WAComponent,
	#instVars : [
		'parent',
		'filtro'
	],
	#category : #'ING2-COMBI19-UI-CHOFER-viajes-UI'
}

{ #category : #'instance creation' }
ViajesChoferView class >> newWithParent: aParent [
	^ self new parent: aParent
]

{ #category : #accessing }
ViajesChoferView >> buscarPorFiltro: html [
	| viajesFiltrados |
	viajesFiltrados := self session user buscarViajeFiltradoPor: filtro.
	viajesFiltrados isEmpty
		ifTrue: [ html heading level4
				with: 'No hay Viajes ' , filtro , 's Para mostrar ' ]
		ifFalse: [ html unorderedList
				class: 'row';
				with: [ viajesFiltrados
						do: [ :viaje | 
							html listItem
								class: 'card col-md-4 bg-white border-warning mx-5 my-3';
								with: [ html
										render:
											(ViajeSeleccionChoferView
												newWithParent: self
												delViaje: viaje
												conFiltro: filtro) ] ] ] ]
]

{ #category : #'as yet unclassified' }
ViajesChoferView >> buscarProximoViaje: html [
	| proximo |
	proximo := self session user buscarProximoViaje.
	html
		render:
			(ViajeSeleccionChoferView newWithParent: self  delViaje: proximo)
]

{ #category : #accessing }
ViajesChoferView >> filtro [
	^ filtro
]

{ #category : #accessing }
ViajesChoferView >> filtro: unFiltro [
	filtro := unFiltro
]

{ #category : #accessing }
ViajesChoferView >> model [
	^ Combi19 soleInstance
]

{ #category : #accessing }
ViajesChoferView >> parent [
	^ parent
]

{ #category : #accessing }
ViajesChoferView >> parent: anObject [
	parent := anObject
]

{ #category : #rendering }
ViajesChoferView >> renderContentOn: html [
	self renderizarBotonBuscar: html .
	self renderizarFiltro: html.
	filtro  
		ifNotNil: [ self buscarPorFiltro: html ]
]

{ #category : #rendering }
ViajesChoferView >> renderizarBotonBuscar: html [
	html
		break;
		break.
	html space.
	html space.
	html anchor
		callback: [  self buscarProximoViaje: html];
		with: [ html submitButton
				class: 'btn btn-primary';
				with: 'Ver proximo viaje' ].
	html break.
	html break
]

{ #category : #rendering }
ViajesChoferView >> renderizarFiltro: html [
	html
		form: [ html div
				class: 'form-group col-5';
				with: [ html label: 'Filtrar por:  '.
					html select
						class: 'form-control required';
						list: #(#Pendiente #Realizado #Cancelado);
						selected: filtro;
						callback: [ :value | filtro := value ] ].
			html space.
			html
				space;
				space;
				space.
			html anchor
				callback: [ self buscarProximoViaje: html  ];
				with: [ html submitButton
						class: 'btn btn-outline-success';
						with: 'Buscar' ].
			html break.
			html
				horizontalRule;
				break ]
]
