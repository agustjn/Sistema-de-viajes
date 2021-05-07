Class {
	#name : #HomeClientComponent,
	#superclass : #WAComponent,
	#category : #'ING2-COMBI19-UI-Cliente-UI'
}

{ #category : #event }
HomeClientComponent >> cerrarSesion [
	self session user: nil.
	self show: LoginComponent new
]

{ #category : #rendering }
HomeClientComponent >> renderContentOn: aCanvas [
	aCanvas heading level1 with: 'Combi-19'.
	aCanvas text: 'Bienvenido cliente: ' , (self session user nombre).
	aCanvas break.
	aCanvas text:'Plan: ',(self session user plan tipo).
	aCanvas break.
		aCanvas anchor
		callback: [ self cerrarSesion ];
		with: 'Cerrar sesion'.
	aCanvas horizontalRule
	
]
