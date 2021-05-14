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
ChoferView >> renderContentOn: html [
	html heading: 'Pantalla de CRUD Choferes'.
	self renderizarChoferes: html.
	html render: deleteErrorView.
	html anchor
		callback: [ self parent activarChoferCreationView ];
		with: [ html submitButton with: 'Crear chofer' ]
]

{ #category : #rendering }
ChoferView >> renderizarChoferes: html [
	"Si no tiene choferes imprime que no tiene"

	self model choferes
		ifNil: [ html heading level4 with: 'No hay Choferes cargadados en el sistema' ];
		ifNotNil: [ html
				unorderedList: [ self model choferes
						do: [ :chofer | 
							html
								listItem: [ html render: (ChoferSelector of: chofer andParent: self) ] ] ] ]
]
