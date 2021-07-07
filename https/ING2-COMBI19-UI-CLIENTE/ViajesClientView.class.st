Class {
	#name : #ViajesClientView,
	#superclass : #WAComponent,
	#instVars : [
		'parent',
		'filtro'
	],
	#category : #'ING2-COMBI19-UI-CLIENTE-Viajes-UI'
}

{ #category : #'instance creation' }
ViajesClientView class >> newWithParent: aParent [
	^ self new parent: aParent
]

{ #category : #'as yet unclassified' }
ViajesClientView >> buscarPorFiltro: html [
	self model administrador viajes isEmpty
		ifTrue: [ html heading level4
				with: 'No hay Viajes ' , filtro , 'Para mostrar ' ]
		ifFalse: [ html unorderedList
				class: 'row';
				with: [ self model administrador viajes
						do: [ :viaje | 
							html listItem
								class: 'card col-md-4 bg-white border-warning mx-5 my-3';
								with: [ html render: (ViajeSelector of: viaje andParent: self) ] ] ] ]
]

{ #category : #accessing }
ViajesClientView >> model [
	^ Combi19 soleInstance
]

{ #category : #accessing }
ViajesClientView >> parent [
	^ parent
]

{ #category : #accessing }
ViajesClientView >> parent: anObject [
	parent := anObject
]

{ #category : #rendering }
ViajesClientView >> renderContentOn: html [
	self renderizarFiltro: html.
	filtro ifNil: [ self renderizarBotonBuscar: html ] ifNotNil: [ self buscarPorFiltro: html ] 
	
]

{ #category : #'as yet unclassified' }
ViajesClientView >> renderizarBotonBuscar: html [
	html
		break;
		break.
	html space.
	html space.
	html anchor
		callback: [ self call: BuscarViajeClienteView new ];
		with: [ html submitButton
				class: 'btn btn-primary';
				with: 'Buscar viaje' ].
]

{ #category : #'as yet unclassified' }
ViajesClientView >> renderizarFiltro: html [
	html div
		class: 'form-group col-5';
		with: [ html label: 'Filtrar por:  '.
			html select
				class: 'form-control required';
				list: #(#Pendientes #Realizados #Cancelados);
				selected: filtro;
				callback: [ :value | filtro := value ] ].
	html space.
	html space.
	html anchor
		callback: [ html render: ViajesClientView ];
		with: [ html submitButton
				class: 'btn btn-outline-success';
				with: 'Buscar' ].
	html break.
	html
		horizontalRule;
		break
]
