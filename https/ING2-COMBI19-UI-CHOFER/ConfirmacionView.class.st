Class {
	#name : #ConfirmacionView,
	#superclass : #WAComponent,
	#instVars : [
		'parent',
		'msj'
	],
	#category : #'ING2-COMBI19-UI-CHOFER-viajes-UI'
}

{ #category : #'instance creation' }
ConfirmacionView class >> newWith: unMsj parent: aParent [
	^ self new
		parent: aParent;
		msj: unMsj;
		yourself
]

{ #category : #accessing }
ConfirmacionView >> msj [
	^ msj
]

{ #category : #accessing }
ConfirmacionView >> msj: unMensaje [
	msj:= unMensaje
]

{ #category : #accessing }
ConfirmacionView >> parent [
	^parent 
]

{ #category : #accessing }
ConfirmacionView >> parent: aParent [
	parent:= aParent
]

{ #category : #rendering }
ConfirmacionView >> renderContentOn: html [
	"html render: msj."
	self renderizarBotones: html
]

{ #category : #accessing }
ConfirmacionView >> renderizarBotones: html [
	html unorderedList
		class: 'text-center my-0';
		with: [ html anchor
				callback: [  ];
				with: [ html submitButton
						class: 'btn btn--success';
						with: 'Confirmar ausentismo' ].
			html anchor
				callback: [  ];
				with: [ html submitButton
						class: 'btn btn-outline-danger';
						with: 'Cancelar ausentismo ' ] ]
]
