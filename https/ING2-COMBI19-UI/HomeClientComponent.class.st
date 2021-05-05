Class {
	#name : #HomeClientComponent,
	#superclass : #WAComponent,
	#category : #'ING2-COMBI19-UI-Cliente-UI'
}

{ #category : #rendering }
HomeClientComponent >> renderContentOn: aCanvas [
	aCanvas heading level1 with: 'Combi-19'.
	aCanvas text: 'Bienvenido : ' , self session user nombre.
	aCanvas horizontalRule.
	aCanvas div: [ aCanvas unorderedList: [ self renderizarLinks:aCanvas ] ]
]

{ #category : #rendering }
HomeClientComponent >> renderizarLinks: html [
	html
		listItem: [ html anchor
								callback: [  ];
								with: 'Choferes' ]
]
