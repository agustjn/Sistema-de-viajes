Class {
	#name : #ChoferSelector,
	#superclass : #WAComponent,
	#instVars : [
		'parent',
		'chofer'
	],
	#category : #'ING2-COMBI19-UI-Chofer-UI'
}

{ #category : #'instance creation' }
ChoferSelector class >> of: aChofer andParent: aParent [
	^ self new inicializeCon: aChofer parent: aParent
]

{ #category : #accessing }
ChoferSelector >> chofer [ ^chofer
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
	html text:'Chofer: ', chofer nombre , ' ' , chofer apellido.
	html space.
	self renderizarBotonesABMOn: html.
]

{ #category : #rendering }
ChoferSelector >> renderizarBotonesABMOn: html [ 
	html anchor
		callback: [ self parent call: (ChoferEditorView newOf: chofer) ];
		with: [ html submitButton with: 'Editar'  ].
	html space.
	html anchor
		callback: [ self model eliminarChofer: chofer.
			self answer ];
		with: [ html submitButton with: 'Eliminar' ]
]
