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
	mensajeExito := nil.
	foroView := ForoView newWithParent: self
]

{ #category : #event }
HomeClientComponent >> activarMensajeExito: unMensaje [
	mensajeExito := GenericAdvertiseView
		newWithParent: self
		heading: unMensaje
		item1: nil
		item2: nil
		item3: nil.
	viajesClientView := nil.
	foroView := nil.
	modificarCuentaView := nil.
]

{ #category : #event }
HomeClientComponent >> activarModificarCuentaView [
	foroView := nil.
	mensajeExito := nil.
	viajesClientView := nil.
	modificarCuentaView := (ModificarCuentaView newWithParent: self)
]

{ #category : #event }
HomeClientComponent >> activarViajesClientView [
	viajesClientView := (ViajesClientView newWithParent: self).
	foroView := nil.
	mensajeExito := nil.
	modificarCuentaView := nil
	
]

{ #category : #event }
HomeClientComponent >> cerrarSesion [
	self session user: nil.
	self show: LoginComponent new
]

{ #category : #event }
HomeClientComponent >> desactivarForoView [ 
	mensajeExito := nil.
	foroView := nil.
]

{ #category : #event }
HomeClientComponent >> desactivarModificarCuentaView [
	modificarCuentaView := nil.
	mensajeExito := nil.
]

{ #category : #event }
HomeClientComponent >> desactivarViajeView [
	viajeView := nil.
	mensajeExito := nil.
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
	aCanvas render: self session user advertencia.
	aCanvas render: foroView.
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
