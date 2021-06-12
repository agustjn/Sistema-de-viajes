Class {
	#name : #ChoferView,
	#superclass : #WAComponent,
	#instVars : [
		'parent',
		'deleteErrorView'
	],
	#category : #'ING2-COMBI19-UI-Chofer-CRUD-UI'
}

{ #category : #'instance creation' }
ChoferView class >> newWithParent: aParent [
	| instance |
	instance := self new.
	instance parent: aParent.
	^instance
]

{ #category : #event }
ChoferView >> activarDeleteErrorView [
		deleteErrorView := (GenericAdvertiseView newWithParent: self 
															 heading:'Error al eliminar chofer , motivo: ' 
															 item1:'El chofer esta asignado a una combi.' 
															 item2:nil
															 item3:nil )
]

{ #category : #event }
ChoferView >> cerrarSesion [
	self session user: nil.
	self answer
]

{ #category : #accessing }
ChoferView >> model [
	^ Combi19 soleInstance
]

{ #category : #accessing }
ChoferView >> parent [
	^ parent
]

{ #category : #accessing }
ChoferView >> parent: anObject [
	parent := anObject
]

{ #category : #rendering }
ChoferView >> renderContentOn: aCanvas [
	aCanvas heading
	level:4;
	with: 'Lista de choferes activos '.
	self renderizarChoferes: aCanvas.
	aCanvas render: deleteErrorView.
	aCanvas anchor
		callback: [ self parent activarChoferCreationView ];
		with: [ aCanvas submitButton
				class: 'btn btn-dark mx-4 my-4' ;
				with: 'Crear Chofer' ].
]

{ #category : #rendering }
ChoferView >> renderizarChoferes: aCanvas [
	"Si no tiene choferes imprime que no tiene"

	self model choferes
		ifNil: [ aCanvas heading level2
				with: 'No hay Choferes cargadados en el sistema' ];
		ifNotNil: [ aCanvas unorderedList
				class: 'row';
				with: [ self model choferes
						do: [ :chofer | aCanvas space.
							aCanvas listItem
								class: 'card col-sm-3 bg-white border-warning mx-4 my-4';
								with: [ aCanvas render: (ChoferSelector of: chofer andParent: self) ] ] ] ]
]

{ #category : #updating }
ChoferView >> updateRoot: anHtmlRoot [ 
    super updateRoot: anHtmlRoot.
    anHtmlRoot stylesheet url: 'https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css'
]
