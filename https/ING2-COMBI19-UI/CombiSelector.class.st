Class {
	#name : #CombiSelector,
	#superclass : #WAComponent,
	#instVars : [
		'combi',
		'parent'
	],
	#category : #'ING2-COMBI19-UI-Combi-UI'
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
CombiSelector >> model [
	^ Combi19 soleInstance
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
	html anchor
		callback: [ self parent call: (CombiEditorView newOf: self combi) ];
		with: [ html submitButton with: 'Editar' ].
	html anchor
		callback: [ self model administrador eliminarCombi: self combi.
			self answer ];
		with: [ html submitButton with: 'Eliminar' ]
]
