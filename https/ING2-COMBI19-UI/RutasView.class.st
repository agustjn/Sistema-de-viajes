Class {
	#name : #RutasView,
	#superclass : #WAComponent,
	#instVars : [
		'parent',
		'ruta',
		'advertiseView'
	],
	#category : #'ING2-COMBI19-UI-Rutas-CRUD-UI'
}

{ #category : #'instance creation' }
RutasView class >> newWithParent: aParent [
	| clase |
	clase := self new.
	clase parent: aParent.
	^ clase
	
	"^ self new parent: aParent"
]

{ #category : #'as yet unclassified' }
RutasView >> advertencia: unaAdvertencia [
	advertiseView := unaAdvertencia 
]

{ #category : #accessing }
RutasView >> model [
	^ Combi19 soleInstance 
]

{ #category : #rendering }
RutasView >> parent [ 
^parent
]

{ #category : #rendering }
RutasView >> parent: aParent [
	parent := aParent
]

{ #category : #rendering }
RutasView >> renderContentOn: html [
	html heading level4 with:'Listado de Rutas activas'.
	
	html anchor
		callback: [ self parent activarRutaCreationView ];
		with: [ html submitButton
				class: 'btn btn-dark mx-4 my-4' ;
				with: 'Crear Ruta' ].
	advertiseView ifNotNil: [ html render: advertiseView  ].
	html horizontalRule.
	self renderizarRutas: html.

]

{ #category : #rendering }
RutasView >> renderizarRutas: html [
	"Si no tiene choferes imprime que no tiene"

	self model administrador rutas isEmpty
		ifTrue: [ html heading level4 with: 'No hay Rutas cargadados en el sistema' ]
		ifFalse: [ html unorderedList
				class: 'row';
				with: [ self model administrador rutas
						do: [ :rut | 
							html listItem
								class: 'card col-md-4 bg-white border-warning mx-5 my-4';
								with: [ html render: (RutaSelector of: rut andParent: self) ] ] ] ]
]
