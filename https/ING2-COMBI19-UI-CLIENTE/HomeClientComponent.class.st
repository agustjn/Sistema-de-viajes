Class {
	#name : #HomeClientComponent,
	#superclass : #WAComponent,
	#instVars : [
		'viajeView',
		'foroView',
		'viajesClientView',
		'modificarCuentaView'
	],
	#category : #'ING2-COMBI19-UI-CLIENTE-Principales-UI'
}

{ #category : #event }
HomeClientComponent >> activarForoView [
self desactivarViajeView.
	foroView := ForoView newWithParent: self
]

{ #category : #event }
HomeClientComponent >> activarModificarCuentaView [
	foroView := nil.
	viajesClientView := nil.
	modificarCuentaView := (ModificarCuentaView newWithParent: self)
]

{ #category : #event }
HomeClientComponent >> activarViajesClientView [
	viajesClientView := (ViajesClientView newWithParent: self).
	foroView := nil.
	modificarCuentaView := nil
	
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
HomeClientComponent >> desactivarModificarCuentaView [
	modificarCuentaView := nil
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
	aCanvas render: (MenuClientView newWithParent: self).
	aCanvas render: foroView.
	aCanvas render: viajeView.
	aCanvas render: viajesClientView.
	aCanvas render: modificarCuentaView
]

{ #category : #updating }
HomeClientComponent >> updateRoot: anHtmlRoot [
	super updateRoot: anHtmlRoot.
	anHtmlRoot stylesheet
		url:
			'https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css'
]
