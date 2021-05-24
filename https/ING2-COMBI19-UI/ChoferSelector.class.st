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
ChoferSelector >> renderContentOn: aCanvas [
	aCanvas div
		with: [ aCanvas div
				class: 'card col-md-12 mt-3';
				
				with: [ aCanvas div
						class: 'card-body';
						with: [ aCanvas
								heading level5 class:'card-header bg-white' ; 
								with:'Chofer ', chofer nombre , ' ' , chofer apellido.
									
								aCanvas break.
								aCanvas paragraph class:'card-text' ;
													with:[aCanvas text:'Email : ' , chofer email.
														   aCanvas break.
														   aCanvas text:'Telefono: ' , chofer telefono.
														   aCanvas break.
														   aCanvas text:'Esta activo: ', self renderizarEstadoChofer].
								] ] ].
	aCanvas space.

	self renderizarBotonesABMOn: aCanvas
]

{ #category : #rendering }
ChoferSelector >> renderizarBotonesABMOn: aCanvas [
	aCanvas div 
		
		with: [ aCanvas anchor
				callback: [ self parent call: (ChoferEditorView newOf: chofer) ];
				with: [ aCanvas submitButton class:'btn btn-dark'; with: 'Editar' ].
			aCanvas space.
			aCanvas anchor
				callback: [ self eliminarChofer
					"self model eliminarChofer: chofer.
			self answer " ];
				with: [ aCanvas submitButton class:'btn btn-dark'; with: 'Eliminar'.
					aCanvas break.
					aCanvas space. ] ].
	
]

{ #category : #rendering }
ChoferSelector >> renderizarEstadoChofer [
	(chofer estado)
			ifTrue:[ ^ 'Si' ]
			ifFalse:[ ^'No']
]
