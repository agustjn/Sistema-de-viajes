Class {
	#name : #LugarSelector,
	#superclass : #WAComponent,
	#instVars : [
		'place',
		'parent',
		'advertiseView',
		'buttonsOff'
	],
	#category : #'ING2-COMBI19-UI-Lugar-CRUD-UI'
}

{ #category : #'instance creation' }
LugarSelector class >> of: lugar andParent: aParent [
	| instance |
	instance := self new.
	instance place: lugar.
	instance parent: aParent.
	instance buttonsOff:false.
	^instance

]

{ #category : #'instance creation' }
LugarSelector class >> of: lugar withButtons: falseBoolean [
	| instance |
	instance := self new.
	instance place: lugar.
   instance buttonsOff: true.
	^instance

]

{ #category : #accessing }
LugarSelector >> buttonsOff [
	^ buttonsOff
]

{ #category : #accessing }
LugarSelector >> buttonsOff: anObject [
	buttonsOff := anObject
]

{ #category : #accessing }
LugarSelector >> eliminarLugar [
	(self model administrador eliminarLugar: place)
		ifTrue: [ self parent  renderAdvertencia: 'El lugar se elimino con exito' ]
		ifFalse: [ self parent 
				renderAdvertencia:
					'No se puede eliminar el lugar ya que esta asociado a una ruta , por favor elimine la ruta para seguir.' ]
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
	html div
		with: [ html div
				class: '';
				with: [ html div
						class: 'card-body';
						with: [ html heading level5
								class: 'card-header text-center border-secondary';
								with: 'Lugar'.
							html paragraph
								class: 'card-text';
								with: [ html strong: 'Provincia: ' ; text: place provincia.
									html break.
									html strong:'Localidad: ' ; text: place localidad] ] ] ].
	html space.
	self renderizarBotonesABMOn: html.
	html render: advertiseView.
	""""""""""
"	html
		text:
			'Lugar / Provincia: ' , place provincia , ' - Localidad: '
				, place localidad.
	html space.
	self renderizarBotonesABMOn: html.
	html render: advertiseView"
]

{ #category : #rendering }
LugarSelector >> renderizarBotonesABMOn: html [
	buttonsOff
		ifFalse: [ html div
				class: 'text-center';
				with: [ html anchor
						callback: [ self parent call: (LugarEditorView newOf: place) ];
						with: [ html submitButton
								class: 'btn btn-warning';
								with: 'Editar' ].
					html space.
					html anchor
						callback: [ self eliminarLugar.
							self answer ];
						with: [ html submitButton
								class: 'btn btn-danger';
								with: 'Eliminar' ].
					html
						break;
						break ] ]
]
