Class {
	#name : #HomeAdminComponent,
	#superclass : #WAComponent,
	#instVars : [
		'choferView',
		'combiView',
		'choferCreationView',
		'lugarView',
		'lugarCreationView'
	],
	#category : #'ING2-COMBI19-UI-Admin-UI'
}

{ #category : #event }
HomeAdminComponent >> activarChoferCreationView [
	choferView := nil.
	combiView := nil.
	lugarView := nil.
	lugarCreationView := nil.
	choferCreationView := (ChoferCreationView newWithParent: self).
]

{ #category : #event }
HomeAdminComponent >> activarChoferView [
	"Si se activa cualquier componente, los demas se desactivan para evitar errores de render"
	choferCreationView := nil.
	combiView := nil.
	lugarView := nil.
	lugarCreationView := nil.
	choferView := (ChoferView newWithParent: self).
]

{ #category : #event }
HomeAdminComponent >> activarCombiView [
	choferView := nil.
	choferCreationView := nil.
	lugarView:=nil.
	combiView := (CombiView newWithParent: self).
]

{ #category : #event }
HomeAdminComponent >> activarLugarCreationView [
	choferView := nil.
	combiView := nil.
	lugarView := nil.
	lugarCreationView := (LugarCreationView newWithParent: self).
]

{ #category : #event }
HomeAdminComponent >> activarLugarView [
	combiView := nil.
	choferView := nil.
	lugarCreationView := nil.
	lugarView := (LugarView newWithParent: self)
]

{ #category : #event }
HomeAdminComponent >> cerrarSesion [
	self session user: nil.
	self answer.
]

{ #category : #event }
HomeAdminComponent >> desactivarChoferCreationView [
	choferCreationView := nil.
]

{ #category : #event }
HomeAdminComponent >> desactivarLugarCreationView [
	lugarCreationView := nil.
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
	aCanvas render: choferCreationView.
	aCanvas render: combiView.

	aCanvas render: lugarView.
	aCanvas render: lugarCreationView.
]
