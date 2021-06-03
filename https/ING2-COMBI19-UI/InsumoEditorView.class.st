Class {
	#name : #InsumoEditorView,
	#superclass : #WAComponent,
	#instVars : [
		'insumo',
		'nombre',
		'marca',
		'precio'
	],
	#category : #'ING2-COMBI19-UI-Insumo-CRUD-UI'
}

{ #category : #'instance creation' }
InsumoEditorView class >> newOf: unInsumo [
	^ self new insumo: unInsumo
]

{ #category : #event }
InsumoEditorView >> guardarDatos [

	self model administrador
		editarInsumo: self insumo
		nombre: self nombre
		marca: self marca
		precio: self precio
]

{ #category : #accessing }
InsumoEditorView >> insumo [
	^ insumo
	
]

{ #category : #accessing }
InsumoEditorView >> insumo: unInsumo [
	insumo := unInsumo 
]

{ #category : #accessing }
InsumoEditorView >> marca [
	^marca
]

{ #category : #accessing }
InsumoEditorView >> marca: unaMarca [
	marca := unaMarca 
]

{ #category : #accessing }
InsumoEditorView >> model [ 
	^ Combi19 soleInstance 
]

{ #category : #accessing }
InsumoEditorView >> nombre [ 	^nombre
]

{ #category : #accessing }
InsumoEditorView >> nombre: unNombre [
	nombre := unNombre 
]

{ #category : #accessing }
InsumoEditorView >> precio [
	^precio
]

{ #category : #accessing }
InsumoEditorView >> precio: unPrecio [
	precio := unPrecio 
]

{ #category : #rendering }
InsumoEditorView >> renderContentOn: html [
	html
		form: [ self renderizarCamposBasicosOn: html.
			html horizontalRule.
			self renderizarBotonesOn: html ]
]

{ #category : #rendering }
InsumoEditorView >> renderizarAdvertencia: html [
	html
		div: [ html heading level2 with: 'Aviso'.
			html
				unorderedList: [ html
						listItem: 'Los campos que no se quieran modificar, se deben dejar vacios.'.
					html
						listItem:
							'Los caracteres en transparente indican los datos previos a la edicion.' ] ]
]

{ #category : #rendering }
InsumoEditorView >> renderizarBotonesOn: html [
	html submitButton
		callback: [ self guardarDatos.
			self answer ];
		value: 'Confirmar!'.
	html space.
	html submitButton
		callback: [ self answer ];
		value: 'Cancelar'
]

{ #category : #rendering }
InsumoEditorView >> renderizarCamposBasicosOn: html [
	html horizontalRule.
	html heading: 'Editar datos'.
	self renderizarAdvertencia: html.
	self renderizarCamposOn: html
]

{ #category : #rendering }
InsumoEditorView >> renderizarCamposOn: html [
	html text: 'Nombre del producto'.
	html break.
	(html textInput on: #nombre of: self) placeholder: self insumo nombre.
	html break.
	html text: 'Marca del producto '.
	html break.
	(html textInput on: #marca of: self) placeholder: self insumo marca.
	html break.
	html text: 'precio'.
	html break.
	(html textInput on: #precio of: self) placeholder: self insumo precio
]
