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
	choferName
		ifNil: [ self renderAdvertencia: 'Seleccione un chofer' ]
		ifNotNil: [ (self model administrador
				agregarCombiModelo: self modelo
				patente: self patente
				cantidadAsientos: self cantidad
				chofer: (self model buscarChoferNombre: choferName)
				tipo: self tipo)
				ifTrue: [ self parent desactivarCombiCreationView ]
				ifFalse: [ self
						renderAdvertencia: 'La patente' , self patente , ' ya existe' ] ]
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
CombiCreationView >> renderAdvertencia: text [ 
advertiseView := GenericAdvertiseView
						newWithParent: self
						heading: 'Error al agregar combi'
						item1: text
						item2: nil
						item3: nil 
]

{ #category : #rendering }
CombiCreationView >> renderContentOn: html [
	self model choferesDisponibles
		ifNil: [ self
				renderAdvertencia:
					'No hay choferes disponibles, por favor agregue un chofer para continuar'.
					html render: advertiseView]
		ifNotNil: [ html heading level2 with: 'Creacion de nueva combi'.
			html horizontalRule.
			html
				form: [ self renderizarFormularioOn: html.
					html break.
					html break.
					html render: advertiseView.
					html submitButton
						callback: [ self guardarCombi ];
						value: 'Guardar'.
					html space.
					html space.
					html submitButton
						callback: [ self parent desactivarCombiCreationView ];
						with: 'Cancelar' ] ]
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
	(html select on: #tipo of: self) list: self tiposDeAsientos.
	html break.	
	(html select on: #choferName of: self)
		list: self model choferesDisponibles;
		selected: choferName
]

{ #category : #accessing }
CombiCreationView >> tipo [
	^tipo
]

{ #category : #accessing }
CombiCreationView >> tipo: unTipo [
	tipo := unTipo 
]

{ #category : #'as yet unclassified' }
CombiCreationView >> tiposDeAsientos [
	|tipos|
	tipos := OrderedCollection new.
	tipos add: 'Cama'; add: 'Semi-Cama'.
	^tipos
]
