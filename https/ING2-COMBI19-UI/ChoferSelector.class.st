Class {
	#name : #ChoferSelector,
	#superclass : #WAComponent,
	#instVars : [
		'chofer',
		'parent'
	],
	#category : #'ING2-COMBI19-UI-Admin-UI'
}

{ #category : #'instance creation' }
ChoferSelector class >> of: unChofer andParent: aParent [
	| instance |
	instance := self new.
	instance parent: aParent.
	instance chofer: unChofer.
	^instance
]

{ #category : #accessing }
ChoferSelector >> chofer [
	^ chofer
]

{ #category : #accessing }
ChoferSelector >> chofer: anObject [
	chofer := anObject
]

{ #category : #accessing }
ChoferSelector >> parent [
	^ parent
]

{ #category : #accessing }
ChoferSelector >> parent: anObject [
	parent := anObject
]

{ #category : #rendering }
ChoferSelector >> renderContentOn: html [
	html text:'Chofer: ', chofer nombre , ' ' , chofer apellido.
	html space.
	self renderizarBotonesABMOn: html.
]

{ #category : #rendering }
ChoferSelector >> renderizarBotonesABMOn: html [
	html anchor
		callback: [ self parent call: (EditorChoferView newOf:chofer) ];
		with: [ html submitButton with: 'Editar' ].
	html submitButton
		callback: [  ];
		with: 'Eliminar'
]
