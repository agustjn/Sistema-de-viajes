Class {
	#name : #ViajeSelector,
	#superclass : #WAComponent,
	#instVars : [
		'parent',
		'viaje'
	],
	#category : #'ING2-COMBI19-UI-Viaje-UI'
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
	html text:'Viaje desde:  ', viaje ruta origen , ' hasta  ' , viaje ruta destino.
	html text: 'El dia: ', viaje fecha, ' a las ', viaje hora.
	html space.
	self renderizarBotonesABMOn: html
]

{ #category : #rendering }
ViajeSelector >> renderizarBotonesABMOn: html [
	html anchor
		callback: [ self parent call: (ViajeEditView newOf: self viaje) ];
		with: [ html submitButton with: 'Editar' ].
	html space.
	html anchor
		callback: [ self model administrador eliminarViaje: self viaje.
			self answer ];
		with: [ html submitButton with: 'Eliminar' ]
]

{ #category : #'as yet unclassified' }
ViajeSelector >> viaje [
	^ viaje
]