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
	html render: msj.
	 self renderizarBotones: html
]

{ #category : #accessing }
ConfirmacionView >> renderizarBotones: html [
	html unorderedList
		class: 'nav justify-content-center nav-tabs my-0';
		with: [ html anchor
				class: 'nav-item ml-4 my-0 py-0';
				with: [ html submitButton
						class: 'btn btn-outline-success';
						callback: [ self answer: true ];
						with: 'Confirmar' ].
			html anchor
				class: 'nav-item ml-4';
				with: [ html submitButton
						class: 'btn btn-outline-secondary';
						callback: [ self answer: false ];
						with: 'Cancelar' ] ]
]
