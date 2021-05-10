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
		'choferName',
		'chofer'
	],
	#category : #'ING2-COMBI19-UI-Combi-CRUD-UI'
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

{ #category : #event }
CombiCreationView >> buscarChofer [
	chofer :=  self model buscarChoferMail: chofer mail
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
CombiCreationView >> choferName [
	^ choferName
]

{ #category : #accessing }
CombiCreationView >> choferName: anObject [
	choferName := anObject
]

{ #category : #accessing }
CombiCreationView >> choferesDisponibles [
	^ self model choferesDisponibles collect: [ :chofer | chofer nombre ]
]

{ #category : #event }
CombiCreationView >> guardarCombi [
	self model administrador
		agregarCombiModelo: self modelo
		patente: self patente
		cantidadAsientos: self cantidad
		chofer: (self model buscarChoferNombre: choferName)
		tipo: self tipo.
	self parent desactivarCombiCreationView.

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

{ #category : #rendering }
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
	(html select on:#choferName of: self)
		list: self model choferesDisponibles;
		selected: choferName.
]

{ #category : #accessing }
CombiCreationView >> tipo [
	^tipo
]

{ #category : #accessing }
CombiCreationView >> tipo: unTipo [
	tipo := unTipo 
]
