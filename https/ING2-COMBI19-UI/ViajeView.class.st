Class {
	#name : #ViajeView,
	#superclass : #WAComponent,
	#instVars : [
		'parent',
		'combi',
		'fecha',
		'hora',
		'precio',
		'ruta'
	],
	#category : #'ING2-COMBI19-UI-Viaje-UI'
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
	html heading: 'Pantalla de CRUD Viajes'.
	self renderizarViaje: html.
	html anchor
		callback: [ self parent activarViajeCreationView ];
		with: [ html submitButton with: 'Crear Viaje' ]
]

{ #category : #'as yet unclassified' }
ViajeView >> renderizarViaje: html [
	self viajes
		ifNil: [ html heading level4 with: 'No hay viajes pendientes' ]
		ifNotNil: [ html
				unorderedList: [ self viajes
						do: [ :viaje | 
							html
								listItem: [ html render: (ViajeSelector of: viaje andParent: self) ] ] ] ]
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