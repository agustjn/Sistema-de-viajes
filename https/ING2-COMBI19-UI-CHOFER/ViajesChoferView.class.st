Class {
	#name : #ViajesChoferView,
	#superclass : #WAComponent,
	#instVars : [
		'parent',
		'filtro',
		'verProxViajeView',
		'advertencia'
	],
	#category : #'ING2-COMBI19-UI-CHOFER-viajes-UI'
}

{ #category : #'instance creation' }
ViajesChoferView class >> newWithParent: aParent [
	^ self new parent: aParent
]

{ #category : #'as yet unclassified' }
ViajesChoferView >> advertenciaCorrecta [
	advertencia:=  GenericAdvertiseView
		newWithParent: self
		heading: 'Error al buscar proximo viaje   '
		item1: 'Usted no posee proximos viajes '
		item2: nil
		item3: nil
]

{ #category : #accessing }
ViajesChoferView >> buscarPorFiltro: html [
	| viajesFiltrados |
	verProxViajeView := nil.
	 advertencia := nil.
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
	filtro := nil.
	proximo := self session user buscarProximoViaje.
	proximo
		ifNil: [ self advertenciaCorrecta ]
		ifNotNil: [ advertencia := nil.
			verProxViajeView := ViajeSeleccionChoferView
				newWithParent: self
				delViaje: proximo
				]
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
	html render: advertencia.
	self renderizarBotonBuscar: html.
	html horizontalRule.
	self renderizarFiltro: html.
	filtro ifNotNil: [ self buscarPorFiltro: html ].
		html render: verProxViajeView.
]

{ #category : #rendering }
ViajesChoferView >> renderizarBotonBuscar: html [
	html
		break;
		break.
	html space.
	html space.
	html anchor
		callback: [ self buscarProximoViaje: html ];
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
						list: #(#Pendiente #Realizado #Cancelado #Iniciado);
						selected: filtro;
						callback: [ :value | filtro := value ] ].
			html space.
			html
				space;
				space;
				space.
			html anchor
				callback: [ self buscarPorFiltro: html ];
				with: [ html submitButton
						class: 'btn btn-outline-success';
						with: 'Buscar' ].
			html break.
			html
				horizontalRule;
				break ]
]
