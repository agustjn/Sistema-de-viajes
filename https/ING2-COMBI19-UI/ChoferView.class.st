Class {
	#name : #ChoferView,
	#superclass : #WAComponent,
	#category : #'ING2-COMBI19-UI'
}

{ #category : #accessing }
ChoferView >> model [
	^ Combi19 soleInstance
]

{ #category : #rendering }
ChoferView >> renderContentOn: html [
	html heading: 'Pantalla de CRUD Choferes'.
	self renderizarChoferes: html.
]

{ #category : #rendering }
ChoferView >> renderizarChoferes: html [
	html
		unorderedList: [ self model choferes
				do: [ :chofer | 
					html
						listItem: [ html render: (ChoferSelector of: chofer andParent: self) ] ] ]
]
