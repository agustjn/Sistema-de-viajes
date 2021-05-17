Class {
	#name : #ChoferSelector,
	#superclass : #WAComponent,
	#instVars : [
		'parent',
		'chofer'
	],
	#category : #'ING2-COMBI19-UI-Chofer-CRUD-UI'
}

{ #category : #'instance creation' }
ChoferSelector class >> of: aChofer andParent: aParent [
	^ self new inicializeCon: aChofer parent: aParent
]

{ #category : #accessing }
ChoferSelector >> chofer [ ^chofer
]

{ #category : #event }
ChoferSelector >> eliminarChofer [
	(self model eliminarChofer: chofer)
		ifFalse:[ self parent activarDeleteErrorView ]
	"self model eliminarChofer: chofer.
			self answer "

]

{ #category : #'as yet unclassified' }
ChoferSelector >> inicializeCon: aChofer parent: aParent [
 parent:= aParent.
chofer := aChofer	
]

{ #category : #accessing }
ChoferSelector >> model [ 
	^Combi19 soleInstance
]

{ #category : #accessing }
ChoferSelector >> parent [ 
	^parent
]

{ #category : #rendering }
ChoferSelector >> renderContentOn: html [
	html div
		with: [ html div
				class: 'car';
				with: [ html div
						class: 'card-body';
						with: [ html
								heading level5 class:'card-header' ; 
								with:'Chofer ', chofer nombre , ' ' , chofer apellido.
								html paragraph class:'card-text' ;
													with:[html text:'Email : ' , chofer email.
														   html break.
														   html text:'Telefono: ' , chofer telefono.
														   html break.
														   html text:'Esta activo: ', self renderizarEstadoChofer].
								] ] ].
	html space.
	self renderizarBotonesABMOn: html
]

{ #category : #rendering }
ChoferSelector >> renderizarBotonesABMOn: html [
	html div
		with: [ html anchor
				callback: [ self parent call: (ChoferEditorView newOf: chofer) ];
				with: [ html submitButton class:'btn-dark'; with: 'Editar' ].
			html space.
			html anchor
				callback: [ self eliminarChofer
					"self model eliminarChofer: chofer.
			self answer " ];
				with: [ html submitButton class:'btn-dark'; with: 'Eliminar'.
					html break.
					html space. ] ].
	
]

{ #category : #rendering }
ChoferSelector >> renderizarEstadoChofer [
	(chofer estado)
			ifTrue:[ ^ 'Si' ]
			ifFalse:[ ^'No']
]
