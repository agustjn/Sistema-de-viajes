Class {
	#name : #HomeChoferComponent,
	#superclass : #WAComponent,
	#instVars : [
		'foroView',
		'viajesChoferView',
		'detallesViajeView',
		'formularioCovidView',
		'mensajeExito'
	],
	#category : #'ING2-COMBI19-UI-CHOFER-Principals-UI'
}

{ #category : #'as yet unclassified' }
HomeChoferComponent >> activarDetallesViajeView: aViaje [
	detallesViajeView := DetallesViajeView newWith: aViaje parent: self.
	foroView := nil.
	viajesChoferView := nil.
	formularioCovidView := nil.
	mensajeExito :=nil
]

{ #category : #'as yet unclassified' }
HomeChoferComponent >> activarFomularioCovidViewWith: unPasajero [
	formularioCovidView := FormularioCovidView
		newWith: unPasajero
		parent: self.
	detallesViajeView := nil.
	foroView := nil.
	viajesChoferView := nil.
	mensajeExito :=nil
]

{ #category : #event }
HomeChoferComponent >> activarForoView [
	foroView := ForoView newWithParent: self.
	viajesChoferView := nil.
	detallesViajeView := nil.
	formularioCovidView := nil.
	mensajeExito :=nil
]

{ #category : #event }
HomeChoferComponent >> activarMensajeExito: unMensaje [
	mensajeExito := GenericAdvertiseView
		newWithParent: self
		heading: unMensaje
		item1: nil
		item2: nil
		item3: nil.
	detallesViajeView := nil.
	foroView := nil.
	formularioCovidView := nil.
	viajesChoferView := nil.

]

{ #category : #'as yet unclassified' }
HomeChoferComponent >> activarViajesChoferView [
	viajesChoferView := ViajesChoferView newWithParent: self.
	detallesViajeView := nil.
	foroView := nil.
	formularioCovidView := nil.
	mensajeExito :=nil
]

{ #category : #event }
HomeChoferComponent >> cerrarSesion [ 
	self session user: nil.
	self show: LoginComponent new
]

{ #category : #'as yet unclassified' }
HomeChoferComponent >> desactivarDetallesViajeView [
	detallesViajeView := nil.
]

{ #category : #event }
HomeChoferComponent >> desactivarForoView [
	foroView := nil
]

{ #category : #'as yet unclassified' }
HomeChoferComponent >> desactivarViajesChoferView [
	viajesChoferView := nil.
]

{ #category : #rendering }
HomeChoferComponent >> renderContentOn: aCanvas [
	aCanvas heading level1 with: 'Combi-19'.
	aCanvas text: 'Bienvenido Chofer:  ' , self session user nombre.
	aCanvas break.
	aCanvas anchor
		callback: [ self cerrarSesion ];
		with: 'Cerrar sesion'.
	aCanvas horizontalRule.
	aCanvas render: (MenuChoferView newWithParent: self).
	aCanvas render: mensajeExito .
	aCanvas render: detallesViajeView.
	aCanvas render: foroView.
	aCanvas render: viajesChoferView.
	aCanvas render: formularioCovidView
]

{ #category : #updating }
HomeChoferComponent >> updateRoot: anHtmlRoot [ 
    super updateRoot: anHtmlRoot.
    anHtmlRoot stylesheet url: 'https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css'
]
