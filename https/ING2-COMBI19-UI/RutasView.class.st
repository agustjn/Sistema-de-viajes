Class {
	#name : #RutasView,
	#superclass : #WAComponent,
	#instVars : [
		'parent',
		'ruta'
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
	self halt.
	html heading: 'Pantalla de CRUD Rutas'.
	self renderizarRutas: html.
	html anchor
		callback: [ self parent activarRutaCreationView ];
		with: [ html submitButton with: 'Crear Ruta' ]
]

{ #category : #rendering }
RutasView >> renderizarRutas: html [
	"Si no tiene choferes imprime que no tiene"

	(self model administrador rutas)
		isEmpty
				ifTrue:[ html heading level4 with: 'No hay Rutas cargadados en el sistema' ]
		ifFalse: [ html
				unorderedList: [ self model administrador rutas
						do: [ :rut | 
							html
								listItem: [ html render: (RutaSelector of: rut andParent: self) ] ] ] ]
]
