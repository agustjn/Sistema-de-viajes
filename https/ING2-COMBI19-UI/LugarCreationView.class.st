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
	#category : #'ING2-COMBI19-UI-Lugar-UI'
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
	(self model administrador agregarLugar:(Lugar deProvincia:provincia yLocalidad:localidad ))
		ifFalse:[ advertiseView := 'Hi bitch' ]
		ifTrue:[ self parent desactivarLugarCreationView  ]
]

{ #category : #accessing }
LugarCreationView >> localidad [
	^ localidad
]

{ #category : #accessing }
LugarCreationView >> localidad: anObject [
	localidad := anObject
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
	html heading level2 with:'Creacion de nuevo lugar'.
	html horizontalRule.
	html form:[ self renderizarFormularioOn: html.
					html break.
						html submitButton
							callback: [ self guardarLugar ];
							value: 'Guardar'.
					html space. 
					html space.
					html submitButton
								callback:[ self parent desactivarLugarCreationView ];
								with:'Cancelar' .
					].
	html render:advertiseView. "FALTA APLICAR"
	
]

{ #category : #rendering }
LugarCreationView >> renderizarFormularioOn: html [
	html text:'Provincia: '.
	html space.
	(html select on:#provincia of:self) list:(self model provinciasArgentinas).
	html break.
	html break.
	html text:'Localidad: '.
	html textInput on:#localidad of:self.
	html horizontalRule.
	"html select list:
				(self model provinciasArgentinas) ;
				selected: provincia ;
				callback:[ :value | provincia := value]"

]
