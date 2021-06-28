Class {
	#name : #HomeClientComponent,
	#superclass : #WAComponent,
	#instVars : [
		'viajeView',
		'foroView'
	],
	#category : #'ING2-COMBI19-UI-Cliente-UI'
}

{ #category : #event }
HomeClientComponent >> activarForoView [
self desactivarViajeView.
	foroView := ForoView newWithParent: self
]

{ #category : #event }
HomeClientComponent >> activarViajesView [
	self desactivarForoView.
	viajeView := ViajeClienteView  newWithParent: self
]

{ #category : #event }
HomeClientComponent >> cerrarSesion [
	self session user: nil.
	self show: LoginComponent new
]

{ #category : #event }
HomeClientComponent >> desactivarForoView [ 
	foroView := nil.
]

{ #category : #event }
HomeClientComponent >> desactivarViajeView [
	viajeView := nil.
]

{ #category : #rendering }
HomeClientComponent >> renderContentOn: aCanvas [
	aCanvas heading level1 with: 'Combi-19'.
	aCanvas text: 'Bienvenido cliente: ' , self session user nombre.
	aCanvas break.
	aCanvas text: 'Plan: ' , self session user plan tipo.
	aCanvas break.
	aCanvas anchor
		callback: [ self cerrarSesion ];
		with: 'Cerrar sesion'.
	aCanvas horizontalRule.
	aCanvas render: (MenuClienteView newWithParent: self).
	aCanvas render: foroView.
	aCanvas render: viajeView.
]

{ #category : #updating }
HomeClientComponent >> updateRoot: anHtmlRoot [
	super updateRoot: anHtmlRoot.
	anHtmlRoot stylesheet
		url:
			'https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css'
]
