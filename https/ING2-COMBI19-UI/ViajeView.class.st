Class {
	#name : #ViajeView,
	#superclass : #WAComponent,
	#instVars : [
		'parent',
		'combi',
		'fecha',
		'hora',
		'precio',
		'ruta',
		'advertencia'
	],
	#category : #'ING2-COMBI19-UI-Viaje-CRUD-UI'
}

{ #category : #'instance creation' }
ViajeView class >> newWithParent: aParent [
	^ self new parent: aParent 
]

{ #category : #accessing }
ViajeView >> combi [ 	
	^combi
]

{ #category : #accessing }
ViajeView >> combi: aCombi [
	combi := aCombi 
]

{ #category : #accessing }
ViajeView >> fecha [ ^fecha
]

{ #category : #accessing }
ViajeView >> fecha: aFecha [
	fecha:= aFecha 
]

{ #category : #accessing }
ViajeView >> hora [ ^hora
]

{ #category : #accessing }
ViajeView >> hora: aHora [
	hora := aHora
]

{ #category : #accessing }
ViajeView >> model [ 	
	^ Combi19 soleInstance 
]

{ #category : #accessing }
ViajeView >> parent [
	^parent
]

{ #category : #accessing }
ViajeView >> parent: aParent [
	parent:= aParent
	
]

{ #category : #rendering }
ViajeView >> renderContentOn: html [
	html heading level4 with: 'Listado de Viajes'.
	html horizontalRule.
	html
		render: advertencia. html anchor
			callback: [ self parent activarViajeCreationView ];
		with: [ html submitButton
				class: 'btn btn-dark mx-4 my-4';
				with: 'Crear Viaje' ].
	self renderizarViaje: html
]

{ #category : #'as yet unclassified' }
ViajeView >> renderizarAdvertenciaFallida [
	advertencia = GenericAdvertiseView
		newWithParent: self
		heading: 'No se pudo eliminar el viaje   '
		item1: 'Este viaje ya esta en curso'
		item2: nil
		item3: nil
]

{ #category : #'as yet unclassified' }
ViajeView >> renderizarAdvetencia: adv [
	advertencia := GenericAdvertiseView
		newWithParent: self
		heading: 'Se cancelo el viaje correctamente   '
		item1: adv 
		item2: nil
		item3: nil
]

{ #category : #'as yet unclassified' }
ViajeView >> renderizarViaje: html [
	
					
		self model administrador viajes isEmpty
		ifTrue: [ html heading level4 with: 'No hay Viajes cargadados en el sistema' ]
		ifFalse: [ html unorderedList
				class: 'row';
				with: [ self model administrador viajes
						do: [ :viaje | 
							html listItem
								class: 'card col-md-4 bg-white border-warning mx-5 my-3';
								with: [ html render: (ViajeSelector of: viaje andParent: self) ] ] ] ]
]

{ #category : #accessing }
ViajeView >> ruta [ ^ruta
]

{ #category : #accessing }
ViajeView >> ruta: aRuta [
	ruta := aRuta
]

{ #category : #accessing }
ViajeView >> viajes [
	^self model administrador viajes
]
