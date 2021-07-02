Class {
	#name : #LugarCreationView,
	#superclass : #WAComponent,
	#instVars : [
		'advertiseView',
		'parent',
		'provincia',
		'localidad',
		'lugar'
	],
	#category : #'ING2-COMBI19-UI-Lugar-CRUD-UI'
}

{ #category : #'instance creation' }
LugarCreationView class >> newWithParent: aParent [
	| instance |
	instance := self new.
	instance parent: aParent.
	^instance
]

{ #category : #accessing }
LugarCreationView >> advertiseView [
	^ advertiseView
]

{ #category : #accessing }
LugarCreationView >> advertiseView: anObject [
	advertiseView := anObject
]

{ #category : #event }
LugarCreationView >> guardarLugar [
	( (self model administrador agregarLugar:( Lugar deProvincia:provincia yLocalidad:localidad content ) ) & ( localidad esValido ) )
		ifFalse:[ advertiseView := GenericAdvertiseView newWithParent: self 
																	  heading: 'Error al agregar lugar'  
																	  item1:'La provincia y la localidad ingresadas ya existen en el sistema' 
																	  item2:'Algun campo pudo haber quedado vacio' 
																	  item3:nil  ]
		ifTrue:[ self parent desactivarLugarCreationView  ]
]

{ #category : #initialization }
LugarCreationView >> initialize [
	super initialize.
	localidad := InputField newWithStrategy: EmptyValidator new.
]

{ #category : #accessing }
LugarCreationView >> localidad [
	^ localidad content
]

{ #category : #accessing }
LugarCreationView >> localidad: aString [
	"Para setear la v.i. content de localidad (que es instancia de InputField) y no cambiar mucho codigo en los textInput on:#localidad... directamente el texto se sigue seteando con el 'localidad: ' , solo que internamente en este metodo, le asigna a localidad content: el string ingresado "
	localidad content: aString
]

{ #category : #accessing }
LugarCreationView >> lugar [
	^ lugar
]

{ #category : #accessing }
LugarCreationView >> lugar: anObject [
	lugar := anObject
]

{ #category : #accessing }
LugarCreationView >> model [
	^ Combi19 soleInstance
]

{ #category : #accessing }
LugarCreationView >> parent [
	^ parent
]

{ #category : #accessing }
LugarCreationView >> parent: anObject [
	parent := anObject
]

{ #category : #accessing }
LugarCreationView >> provincia [
	^ provincia
]

{ #category : #accessing }
LugarCreationView >> provincia: anObject [
	provincia := anObject
]

{ #category : #rendering }
LugarCreationView >> renderContentOn: html [
	html heading level2 with: 'Creacion de nuevo lugar'.
	html horizontalRule.
	html
		form: [ self renderizarFormularioOn: html.
			html break.
			html submitButton
				callback: [ self guardarLugar. self parent activarLugarView  ];
				value: 'Guardar'.
			html space.
			html space.
			html submitButton
				callback: [ self parent desactivarLugarCreationView ];
				with: 'Cancelar' ].
	html render: advertiseView	
]

{ #category : #rendering }
LugarCreationView >> renderizarFormularioOn: html [
	html text:'Provincia: '.
	html space.
	(html select on:#provincia of:self) list:(self model provinciasArgentinas).
	html break.
	html break.
	html text:'Localidad: '.
	html textInput on:#content of:localidad.
	html horizontalRule.

]
