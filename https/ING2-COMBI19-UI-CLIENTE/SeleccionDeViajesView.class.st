Class {
	#name : #SeleccionDeViajesView,
	#superclass : #WAComponent,
	#instVars : [
		'viajeBuscado',
		'parent'
	],
	#category : #'ING2-COMBI19-UI-CLIENTE-Viajes-UI'
}

{ #category : #'instance creation' }
SeleccionDeViajesView class >> newOfViaje: viaje withParent: aParent [
	^ self new viajeBuscado: viaje;
				  parent: aParent;
					yourself
]

{ #category : #accessing }
SeleccionDeViajesView >> model [
	^ Combi19 soleInstance 
]

{ #category : #accessing }
SeleccionDeViajesView >> parent [
	^ parent
]

{ #category : #accessing }
SeleccionDeViajesView >> parent: anObject [
	parent := anObject
]

{ #category : #rendering }
SeleccionDeViajesView >> renderContentOn: html [
	html div class:'container';
			   with:[ html strong: 'Viajes encontrados'.
						 html break.
						 self renderizarViajes: html].
	
]

{ #category : #'as yet unclassified' }
SeleccionDeViajesView >> renderizarViajes: html [
	| travels |
	travels := self model administrador
		buscarViajesIdenticosA: viajeBuscado.
	html unorderedList
		class: 'row';
		with: [ travels
				do: [ :viaje | 
					html listItem
						class: 'card col-md-4 bg-white border-warning mx-5 my-3';
						with: [ html
								render: (ViajeSeleccionView newWithParent: self delViaje: viaje) ] ] ]
]

{ #category : #accessing }
SeleccionDeViajesView >> viajeBuscado [
	^ viajeBuscado
]

{ #category : #accessing }
SeleccionDeViajesView >> viajeBuscado: anObject [
	viajeBuscado := anObject
]
