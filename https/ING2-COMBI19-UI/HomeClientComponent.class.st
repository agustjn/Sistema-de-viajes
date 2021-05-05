Class {
	#name : #HomeClientComponent,
	#superclass : #WAComponent,
	#category : #'ING2-COMBI19-UI-Cliente-UI'
}

{ #category : #rendering }
HomeClientComponent >> renderContentOn: aCanvas [
	aCanvas heading level1 with:'Combi-19'.
	aCanvas text:'Bienvenido : ' , self session user nombre.
]
