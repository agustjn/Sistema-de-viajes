Class {
	#name : #CombiView,
	#superclass : #WAComponent,
	#category : #'ING2-COMBI19-UI-Admin-UI'
}

{ #category : #accesing }
CombiView >> model [
	^Combi19 soleInstance
]

{ #category : #rendering }
CombiView >> renderContentOn: html [
	html heading: 'Pantalla de CRUD Combis'.
	self renderizarCombisOn: html
]

{ #category : #rendering }
CombiView >> renderizarCombisOn: html [
	html
		unorderedList: [ self model administrador combis
				do: [ :combi | 
					html
						listItem: [ html render: (CombiSelector of: combi andParent: self) ] ] ]
]
