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
		ifFalse: [  self parent activarDeleteErrorView ]
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
				class: '';
				
				with: [ html div
						class: 'card-body';
						with: [ html
								heading level5 class:'card-header text-center border-secondary' ; 
								with:'Chofer'.
									
								html break.
								html paragraph class:'card-text' ;
													with:[html strong:'Nombre: ' ; text: chofer nombre.
															html break.
															html strong:'Apellido/s: ' ; text: chofer apellido.
															html break.
															html strong:'Email : ' ; text:chofer email.
														   html break.
														   html strong:'Telefono: ' ; text:chofer telefono.
														   html break.
														   html strong:'Esta activo: ' ; text: self renderizarEstadoChofer].
								] ] ].
	html space.
	self renderizarBotonesABMOn: html
]

{ #category : #rendering }
ChoferSelector >> renderizarBotonesABMOn: aCanvas [
	aCanvas div
		class: 'text-center';
		with: [ aCanvas anchor
				callback: [ self parent call: (ChoferEditorView newOf: chofer) ];
				with: [ aCanvas submitButton
						class: 'btn btn-warning';
						with: 'Editar' ].
			aCanvas space.
			aCanvas anchor
				callback: [ self eliminarChofer
					"self model eliminarChofer: chofer.
			self answer " ];
				with: [ aCanvas submitButton
						class: 'btn btn-danger';
						with: 'Eliminar'.
					aCanvas break.
					aCanvas space ] ]
]

{ #category : #rendering }
ChoferSelector >> renderizarEstadoChofer [
	(chofer estado)
			ifTrue:[ ^ 'Si' ]
			ifFalse:[ ^'No']
]
