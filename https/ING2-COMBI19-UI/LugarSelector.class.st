Class {
	#name : #LugarSelector,
	#superclass : #WAComponent,
	#instVars : [
		'place',
		'parent'
	],
	#category : #'ING2-COMBI19-UI-Lugar-UI'
}

{ #category : #'instance creation' }
LugarSelector class >> of: lugar andParent: aParent [
	| instance |
	instance := self new.
	instance place: lugar.
	instance parent: aParent.
	^instance

]

{ #category : #accessing }
LugarSelector >> model [
	^ Combi19 soleInstance
]

{ #category : #accessing }
LugarSelector >> parent [
	^ parent
]

{ #category : #accessing }
LugarSelector >> parent: anObject [
	parent := anObject
]

{ #category : #accessing }
LugarSelector >> place [
	^ place
]

{ #category : #accessing }
LugarSelector >> place: anObject [
	place := anObject
]

{ #category : #rendering }
LugarSelector >> renderContentOn: html [
	html text:'Lugar / Provincia: ', place provincia , ' - Localidad: ' , place localidad.
	html space.
	self renderizarBotonesABMOn: html.
]

{ #category : #rendering }
LugarSelector >> renderizarBotonesABMOn: html [
	html anchor
		callback: [ self parent call: (LugarEditorView newOf:place) ];
		with:[html submitButton with:'Editar' ].
	html space.
	html anchor
		callback: [ self model administrador eliminarLugar: place.
						self answer.  ];
		with: [html submitButton with:'Eliminar']
]
