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
	"Hay que preguntar por el origen y el destino  viaje ruta origen , ' hasta  ' , viaje ruta destino."

	html text: 'Viaje con ruta:  ' ; break.
	html text: viaje ruta string.
	html break.
	html text: 'El dia: ' , viaje fecha asString , ' a las ' , viaje ruta horario.
	html break.
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
