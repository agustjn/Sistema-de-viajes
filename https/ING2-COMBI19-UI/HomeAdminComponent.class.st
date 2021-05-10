Class {
	#name : #HomeAdminComponent,
	#superclass : #WAComponent,
	#instVars : [
		'choferView',
		'combiView',
		'choferCreationView',
		'lugarView',
		'lugarCreationView',
		'combiCreationView',
		'viajeView',
		'viajeCreationView',
		'rutasView',
		'insumosView',
		'rutasCreationView',
		'insumoCreationView'
	],
	#category : #'ING2-COMBI19-UI-Admin-UI'
}

{ #category : #event }
HomeAdminComponent >> activarChoferCreationView [
	choferView := nil.
	combiView := nil.
	lugarView := nil.
	viajeView := nil.
	lugarCreationView := nil.
	combiCreationView := nil.
	viajeCreationView := nil.
	choferCreationView := ChoferCreationView newWithParent: self
]

{ #category : #event }
HomeAdminComponent >> activarChoferView [
	"Si se activa cualquier componente, los demas se desactivan para evitar errores de render"

	choferCreationView := nil.
	combiView := nil.
	lugarView := nil.
	viajeView := nil.
	viajeCreationView := nil.
	lugarCreationView := nil.
	combiCreationView := nil.
	choferView := ChoferView newWithParent: self
]

{ #category : #event }
HomeAdminComponent >> activarCombiCreationView [
	choferView := nil.
	combiView := nil.
	lugarView := nil.
	viajeView := nil.
	rutasView := nil.
	insumosView := nil.
	insumosCreationView := nil.
	rutasCreationView := nil.
	viajeCreationView := nil.
	lugarCreationView := nil.
	choferCreationView := nil.
	combiCreationView := CombiCreationView newWithParent: self
]

{ #category : #event }
HomeAdminComponent >> activarCombiView [
	viajeView := nil.
	viajeCreationView := nil.
	choferView := nil.
	rutasView := nil.
	insumosView := nil.
	insumoCreationView := nil.
	rutasCreationView := nil.
	choferCreationView := nil.
	lugarView := nil.
	combiView := CombiView newWithParent: self
]

{ #category : #event }
HomeAdminComponent >> activarInsumoCreationView [
	choferView := nil.
	combiView := nil.
	lugarView := nil.
	viajeView := nil.
	rutasView := nil.
	insumosView := nil.
	insumoCreationView := InsumoCreationView newWithParent: self.
	rutasCreationView := nil.
	viajeCreationView := nil.
	lugarCreationView := nil.
	choferCreationView := nil
]

{ #category : #event }
HomeAdminComponent >> activarInsumoView [
	combiView := nil.
	choferView := nil.
	lugarView := nil.
	rutasView := nil. 
	insumosView := InsumoView newWithParent: self..
	insumoCreationView := nil.
	rutasCreationView := nil.
	lugarCreationView := nil.
	combiCreationView := nil.
	choferCreationView := nil.
	viajeView := nil.
	viajeCreationView := nil
]

{ #category : #event }
HomeAdminComponent >> activarInsumosCreationView [
	choferView := nil.
	combiView := nil.
	lugarView := nil.
	viajeView := nil.
	rutasView := nil.
	insumosView := nil.
	insumoCreationView := InsumoCreationView newWithParent: self..
	rutasCreationView := nil.
	viajeCreationView := nil.
	lugarCreationView := nil.
	choferCreationView := nil
]

{ #category : #event }
HomeAdminComponent >> activarLugarCreationView [
	choferView := nil.
	combiView := nil.
	lugarView := nil.
	viajeView := nil.
	rutasView := nil.
	insumosView := nil.
	insumoCreationView := nil.
	rutasCreationView := nil.
	viajeCreationView := nil.
	lugarCreationView := LugarCreationView newWithParent: self.
	choferCreationView := nil
]

{ #category : #event }
HomeAdminComponent >> activarLugarView [
	combiView := nil.
	choferView := nil.
	viajeView := nil.
	rutasView := nil.
	insumosView := nil.
	insumoCreationView := nil.
	rutasCreationView := nil.
	viajeCreationView := nil.
	lugarCreationView := nil.
	combiCreationView := nil.
	choferCreationView := nil.
	lugarView := LugarView newWithParent: self
]

{ #category : #event }
HomeAdminComponent >> activarRutaCreationView [
	combiView := nil.
	choferView := nil.
	lugarView := nil.
	rutasView := nil.
	insumosView := nil.
	insumoCreationView := nil.
	rutasCreationView := (RutaCreationView newWithParent: self).
	lugarCreationView := nil.
	combiCreationView := nil.
	choferCreationView := nil.
	viajeView := nil.
	viajeCreationView := nil
]

{ #category : #event }
HomeAdminComponent >> activarRutasView [
	combiView := nil.
	choferView := nil.
	lugarView := nil.
	rutasView := RutasView newWithParent: self.
	insumosView := nil.
	insumoCreationView := nil.
	rutasCreationView := nil.
	lugarCreationView := nil.
	combiCreationView := nil.
	choferCreationView := nil.
	viajeView := nil.
	viajeCreationView := nil
]

{ #category : #event }
HomeAdminComponent >> activarViajeCreationView [
	choferView := nil.
	combiView := nil.
	lugarView := nil.
	rutasView := nil.
	insumosView := nil.
	insumoCreationView := nil.
	rutasCreationView := nil.
	lugarCreationView := nil.
	choferCreationView := nil.
	viajeView := nil.
	viajeCreationView := (ViajeCreationView newWithParent: self)
]

{ #category : #event }
HomeAdminComponent >> activarViajeView [
	combiView := nil.
	choferView := nil.
	lugarView := nil.
	rutasView := nil.
	insumosView := nil.
	insumoCreationView := nil.
	rutasCreationView := nil.
	lugarCreationView := nil.
	combiCreationView := nil.
	choferCreationView := nil.
	viajeView := ViajeView newWithParent: self.
	viajeCreationView := nil
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
HomeAdminComponent >> desactivarCombiCreationView [
	combiCreationView := nil
]

{ #category : #event }
HomeAdminComponent >> desactivarInsumoCreationView [
	insumoCreationView := nil
]

{ #category : #event }
HomeAdminComponent >> desactivarLugarCreationView [
	lugarCreationView := nil.
]

{ #category : #event }
HomeAdminComponent >> desactivarRutaCreationView [
	rutasCreationView := nil.
]

{ #category : #event }
HomeAdminComponent >> desactivarViajeCreationView [
	viajeCreationView := nil
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
	aCanvas render: combiCreationView.
	aCanvas render: lugarView.
	aCanvas render: lugarCreationView.
	aCanvas render: viajeView.
	aCanvas render: viajeCreationView.
	aCanvas render: rutasView.
	aCanvas render: rutasCreationView.
	aCanvas render: insumosView.
	aCanvas render: insumoCreationView
]
