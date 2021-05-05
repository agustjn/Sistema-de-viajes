Class {
	#name : #HomeAdminComponent,
	#superclass : #WAComponent,
	#instVars : [
		'choferView',
		'combiView'
	],
	#category : #'ING2-COMBI19-UI-Admin-UI'
}

{ #category : #event }
HomeAdminComponent >> activarChofer [
	"Si se activa cualquier componente, los demas se desactivan para evitar errores de render"

	combiView := nil.
	choferView := ChoferView new.
]

{ #category : #event }
HomeAdminComponent >> activarCombiView [
	choferView := nil.
	combiView := CombiView new.
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
]
