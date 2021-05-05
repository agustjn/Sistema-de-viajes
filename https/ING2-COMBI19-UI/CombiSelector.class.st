Class {
	#name : #CombiSelector,
	#superclass : #WAComponent,
	#instVars : [
		'combi',
		'parent'
	],
	#category : #'ING2-COMBI19-UI-Admin-UI'
}

{ #category : #'instance creation' }
CombiSelector class >> of: aCombi andParent: aParent [
	| instance |
	instance := self new.
	instance parent: aParent.
	instance combi: aCombi.
	^ instance
]

{ #category : #accessing }
CombiSelector >> combi [
	^ combi
]

{ #category : #accessing }
CombiSelector >> combi: anObject [
	combi := anObject
]

{ #category : #accessing }
CombiSelector >> parent [
	^ parent
]

{ #category : #accessing }
CombiSelector >> parent: anObject [
	parent := anObject
]

{ #category : #rendering }
CombiSelector >> renderContentOn: html [
	html
		text: 'Combi / Modelo: ' , combi modelo , ' Patente: ' , combi patente.
	html space.
	self renderizarBotonesABMOn: html
]

{ #category : #rendering }
CombiSelector >> renderizarBotonesABMOn: html [
	html submitButton
		callback: [  ];
		with: 'Editar'.
	html submitButton
		callback: [  ];
		with: 'Eliminar'
	
]
