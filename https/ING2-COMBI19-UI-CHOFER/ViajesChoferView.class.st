Class {
	#name : #ViajesChoferView,
	#superclass : #WAComponent,
	#instVars : [
		'parent',
		'filtro'
	],
	#category : #'ING2-COMBI19-UI-CHOFER-Principals-UI'
}

{ #category : #'instance creation' }
ViajesChoferView class >> newWithParent: aParent [
	^ self new parent: aParent
]

{ #category : #'as yet unclassified' }
ViajesChoferView >> buscarPorFiltro: html [
	self session user  viajes isEmpty
		ifTrue: [ html heading level4
				with: 'No hay Viajes ' , filtro , 'Para mostrar ' ]
		ifFalse: [ html unorderedList
				class: 'row';
				with: [ (self session user buscarViajeFiltradoPor: filtro)
						do: [ :viaje | 
							html listItem
								class: 'card col-md-4 bg-white border-warning mx-5 my-3';
								with: [ html
										render:
											(ViajeSeleccionView
												newWithParent: self
												delViaje: viaje
												conFiltro: filtro) ] ] ] ]
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
		self renderizarFiltro: html.
	filtro
		ifNil: [ self renderizarBotonBuscar: html ]
		ifNotNil: [ self buscarPorFiltro: html ]
]

{ #category : #'as yet unclassified' }
ViajesChoferView >> renderizarBotonBuscar: html [
	html
		break;
		break.
	html space.
	html space.
	html anchor
		callback: [ self session user renderizarEliminado.
			self call: BuscarViajeClienteView new ];
		with: [ html submitButton
				class: 'btn btn-primary';
				with: 'Buscar viaje' ]
]

{ #category : #'as yet unclassified' }
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
			html space.
			html anchor
				callback: [ filtro inspect ];
				with: [ html submitButton
						class: 'btn btn-outline-success';
						with: 'Buscar' ].
			html break.
			html
				horizontalRule;
				break ]
]
