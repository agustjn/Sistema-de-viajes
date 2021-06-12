Class {
	#name : #ViajeSelector,
	#superclass : #WAComponent,
	#instVars : [
		'parent',
		'viaje'
	],
	#category : #'ING2-COMBI19-UI-Viaje-CRUD-UI'
}

{ #category : #'instance creation' }
ViajeSelector class >> of: aViaje andParent: aParent [
	^self new inicializeCon: aViaje parent: aParent
]

{ #category : #'as yet unclassified' }
ViajeSelector >> inicializeCon: aViaje parent: aParent [
	viaje := aViaje.
	parent := aParent
]

{ #category : #'as yet unclassified' }
ViajeSelector >> model [ 
	^Combi19 soleInstance 
]

{ #category : #'as yet unclassified' }
ViajeSelector >> parent [ 
	^parent
]

{ #category : #rendering }
ViajeSelector >> renderContentOn: html [
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
	self renderizarBotonesABMOn: html ]. ]

]

{ #category : #rendering }
ViajeSelector >> renderizarBotonesABMOn: html [

		
	html div
		class: 'text-center';
		with: [ html anchor
				callback: [ self parent call: (ViajeEditView newOf: viaje) ];
				with: [ html submitButton class:'btn btn-warning'; with: 'Editar' ].
			html space.
			html anchor
				callback: [ self model administrador eliminarViaje: self viaje.
					self answer ];
				with: [ html submitButton class:'btn btn-danger'; with: 'Eliminar' ].
				html break ; break. ]
]

{ #category : #rendering }
ViajeSelector >> renderizarItems: html [ 

html div 
  class:'col-md-12';
	with:[
	html heading level6 class:' my-4'; 
		with: viaje ruta string.
		
	html heading level6 class:' my-4';
					with: 'Fecha: ' , viaje fecha asString , ' a las ' , viaje ruta horario asString .

	html heading level6 class:' my-4';
					with: 'Combi: ' , viaje ruta combi string.
					
	html heading level6 class:' my-4';
					with: 'Chofer: ' ,viaje ruta combi stringChofer].

	""
]

{ #category : #'as yet unclassified' }
ViajeSelector >> viaje [
	^ viaje
]
