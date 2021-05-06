Class {
	#name : #HomeAdminComponent,
	#superclass : #WAComponent,
	#instVars : [
		'choferView',
		'combiView',
		'choferCreationView'
	],
	#category : #'ING2-COMBI19-UI-Admin-UI'
}

{ #category : #event }
HomeAdminComponent >> activarChofer [
	"Si se activa cualquier componente, los demas se desactivan para evitar errores de render"
	choferCreationView := nil.
	combiView := nil.
	choferView := (ChoferView newWithParent: self).
]

{ #category : #event }
HomeAdminComponent >> activarChoferCreationView [
	choferView := nil.
	combiView := nil.
	choferCreationView := (ChoferCreationView newWithParent: self).
]

{ #category : #event }
HomeAdminComponent >> activarCombiView [
	choferView := nil.
	choferCreationView := nil.
	combiView := (CombiView newWithParent: self).
]

{ #category : #event }
HomeAdminComponent >> cerrarSesion [
	self session user: nil.
	self answer.
]

{ #category : #rendering }
HomeAdminComponent >> renderContentOn: aCanvas [
	aCanvas heading level1 with: 'Combi-19'.
	aCanvas text: 'Bienvenido admin: ' , self session user nombre.
	aCanvas break.
	aCanvas anchor
		callback: [ self cerrarSesion ];
		with: 'Cerrar sesion'.
	aCanvas horizontalRule.
	aCanvas render: (MenuAdminView newWithParent: self).
	aCanvas render: choferView.
	aCanvas render: combiView.
	aCanvas render: choferCreationView.
]
