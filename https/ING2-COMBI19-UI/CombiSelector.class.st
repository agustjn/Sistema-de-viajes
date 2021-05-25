Class {
	#name : #CombiSelector,
	#superclass : #WAComponent,
	#instVars : [
		'combi',
		'parent',
		'buttonsOff'
	],
	#category : #'ING2-COMBI19-UI-Combi-CRUD-UI'
}

{ #category : #'instance creation' }
CombiSelector class >> of: aCombi andParent: aParent [
	| instance |
	instance := self new.
	instance parent: aParent.
	instance combi: aCombi.
	instance buttonsOff:false.
	^ instance
]

{ #category : #'instance creation' }
CombiSelector class >> of: aCombi withButtons: aBooleanFalse [
	| instance |
	instance := self new.
	instance combi: aCombi.
	instance buttonsOff: true.
	^ instance
]

{ #category : #accessing }
CombiSelector >> buttonsOff [
	^ buttonsOff
]

{ #category : #accessing }
CombiSelector >> buttonsOff: anObject [
	buttonsOff := anObject
]

{ #category : #accessing }
CombiSelector >> combi [
	^ combi
]

{ #category : #accessing }
CombiSelector >> combi: anObject [
	combi := anObject
]

{ #category : #'as yet unclassified' }
CombiSelector >> eliminar [
	self parent renderAdvertenciaFinish.
	(self model administrador eliminarCombi: self combi)
		ifTrue: [ self answer ]
		ifFalse: [ self parent renderAdvertenciaNew ]
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
	html div
		with: [ html div
				class: '';
				with: [ html div
						class: 'card-body';
						with: [ html heading level5
								class: 'card-header text-center border-secondary';
								with: 'Combi'.
							html paragraph
								class: 'card-text';
								with: [ html strong: 'Modelo : ' ; text: combi modelo.
									html break.
									html strong:'Patente: ' ; text:combi patente.
									html break.
									html strong:'Capacidad maxima de asientos: ' ; text: combi cantidadAsientos asString.
									html break.
									html strong:'Chofer asignado: ' ; text:combi chofer nombre , ' ' , combi chofer apellido.
									html break.
									html strong:'Tipo: ' ; text: combi tipo] ] ] ].
	html space.
	self renderizarBotonesABMOn: html
]

{ #category : #rendering }
CombiSelector >> renderizarBotonesABMOn: html [
	buttonsOff
		ifFalse: [ html div
				class: 'text-center';
				with: [ html anchor
						callback: [ self parent call: (CombiEditorView newOf: self combi) ];
						with: [ html submitButton
								class: 'btn btn-warning';
								with: 'Editar' ].
					html space.
					html anchor
						callback: [ self eliminar ];
						with: [ html submitButton
								class: 'btn btn-danger';
								with: 'Eliminar' ].
					html
						break;
						break ] ]
]
