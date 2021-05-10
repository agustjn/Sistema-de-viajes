Class {
	#name : #CombiCreationView,
	#superclass : #WAComponent,
	#instVars : [
		'modelo',
		'patente',
		'cantidadAsiento',
		'tipo',
		'parent',
		'advertiseView',
		'chofer'
	],
	#category : #'ING2-COMBI19-UI-Combi-UI'
}

{ #category : #'instance creation' }
CombiCreationView class >> newWithParent: unParent [
	^ self new parent: unParent
]

{ #category : #accessing }
CombiCreationView >> advertiseView [ 
	^advertiseView 
]

{ #category : #accessing }
CombiCreationView >> advertiseView: unaAdvertise [
	advertiseView := unaAdvertise 
]

{ #category : #'as yet unclassified' }
CombiCreationView >> buscarChofer [
	chofer :=  self model choferesDisponibles   detect: [ :chofi | chofi nombre = chofer ]
]

{ #category : #accessing }
CombiCreationView >> cantidad [
	^cantidadAsiento 
]

{ #category : #accessing }
CombiCreationView >> cantidad: unaCantidad [ 
	cantidadAsiento := unaCantidad 
]

{ #category : #accessing }
CombiCreationView >> chofer [
	^chofer
]

{ #category : #accessing }
CombiCreationView >> chofer: unChofer [
	chofer:= unChofer 
	
]

{ #category : #accessing }
CombiCreationView >> choferesDisponibles [
	^ self model choferesDisponibles collect: [ :chofer | chofer nombre ]
]

{ #category : #'as yet unclassified' }
CombiCreationView >> guardarCombi [
	self model administrador
		agregarCombiModelo: self modelo
		patente: self patente
		cantidadAsientos: self cantidad
		chofer: self buscarChofer
		tipo: self tipo.
	self parent desactivarCombiCreationView
]

{ #category : #accessing }
CombiCreationView >> model [
	^ Combi19 soleInstance
]

{ #category : #accessing }
CombiCreationView >> modelo [ 
^modelo
]

{ #category : #accessing }
CombiCreationView >> modelo: unModelo [
	modelo := unModelo 
]

{ #category : #accessing }
CombiCreationView >> parent [ ^parent
	
]

{ #category : #accessing }
CombiCreationView >> parent: unParent [
	parent := unParent 
	
]

{ #category : #accessing }
CombiCreationView >> patente [
	^ patente
]

{ #category : #accessing }
CombiCreationView >> patente: unaPatente [ 
	patente := unaPatente 
]

{ #category : #rendering }
CombiCreationView >> renderContentOn: html [
	html heading level2 with: 'Creacion de nueva combi'.
	html horizontalRule.
	html
		form: [ self renderizarFormularioOn: html.
			html break.
			html submitButton
				callback: [ self guardarCombi ];
				value: 'Guardar'.
			html space.
			html space.
			html submitButton
				callback: [ self parent desactivarCombiCreationView ];
				with: 'Cancelar' ].
	html render: advertiseView
]

{ #category : #accessing }
CombiCreationView >> renderizarFormularioOn: html [
	html text: 'Modelo'.
	html break.
	html textInput on: #modelo of: self.
	html break.
	html text: 'Patente'.
	html break.
	html textInput on: #patente of: self.
	html break.
	html text: 'Cantidad de asientos '.
	html break.
	html textInput on: #cantidad of: self.
	html break.
	html text: 'Tipo de asientos'.
	html break.
	html textInput on: #tipo of: self.
	html break.
	html select
		list: self choferesDisponibles;
		callback: [ :value | self chofer: value ]
]

{ #category : #accessing }
CombiCreationView >> tipo [
	^tipo
]

{ #category : #accessing }
CombiCreationView >> tipo: unTipo [
	tipo := unTipo 
]
