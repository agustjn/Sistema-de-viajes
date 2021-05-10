Class {
	#name : #ChoferEditorView,
	#superclass : #WAComponent,
	#instVars : [
		'chofer',
		'name',
		'lastname',
		'mail',
		'password',
		'telefono'
	],
	#category : #'ING2-COMBI19-UI-Admin-UI'
}

{ #category : #'instance creation' }
ChoferEditorView class >> newOf: aChofer [
	| instance |
	instance := self new.
	instance chofer: aChofer.
	^ instance
]

{ #category : #accessing }
ChoferEditorView >> chofer [
	^ chofer
]

{ #category : #accessing }
ChoferEditorView >> chofer: anObject [
	chofer := anObject
]

{ #category : #event }
ChoferEditorView >> editarChofer [
	self model editarChofer: chofer email: mail contraseña: password telefono: telefono nombre: name apellido:lastname.
]

{ #category : #initialization }
ChoferEditorView >> initialize [
	super initialize.
]

{ #category : #accessing }
ChoferEditorView >> lastname [
	^ lastname
]

{ #category : #accessing }
ChoferEditorView >> lastname: anObject [
	lastname := anObject
]

{ #category : #accessing }
ChoferEditorView >> mail [
	^ mail
]

{ #category : #accessing }
ChoferEditorView >> mail: anObject [
	mail := anObject
]

{ #category : #accessing }
ChoferEditorView >> model [
	^Combi19 soleInstance
]

{ #category : #accessing }
ChoferEditorView >> name [
	^ name
]

{ #category : #accessing }
ChoferEditorView >> name: anObject [
	name := anObject
]

{ #category : #accessing }
ChoferEditorView >> password [
	^ password
]

{ #category : #accessing }
ChoferEditorView >> password: anObject [
	password := anObject
]

{ #category : #rendering }
ChoferEditorView >> renderContentOn: html [
	html
		form: [ self renderizarCamposBasicosOn: html.
			html horizontalRule.
			self renderizarBotonesOn: html ]
]

{ #category : #rendering }
ChoferEditorView >> renderizarAdvertencia: html [
	html
		div: [ html heading level2 with: 'Aviso'.
			html
				unorderedList: [ 
					html
						listItem: 'Los campos que no se quieran modificar, se deben dejar vacios.'.
					html listItem: 'Los caracteres en transparente indican los datos previos a la edicion.' ] ]
]

{ #category : #rendering }
ChoferEditorView >> renderizarBotonesOn: html [

	html submitButton
					callback: [ self model editarChofer: chofer email: mail contraseña: password telefono: telefono nombre: name apellido:lastname. .
									self answer ] ;
					value:'Confirmar!'.
	html space.
	html submitButton
		callback: [ self answer ];
		value:'Cancelar' 
]

{ #category : #rendering }
ChoferEditorView >> renderizarCamposBasicosOn: html [
	html horizontalRule.
	html heading: 'Editar datos'.	
	self renderizarAdvertencia: html.
	self renderizarCamposOn: html.
]

{ #category : #rendering }
ChoferEditorView >> renderizarCamposOn: html [
	html space.
	html break.
	html text: 'Nombre'.
	html break.
	(html textInput on: #name of: self) placeholder: chofer nombre.
	html break.
	html text: 'Apellido/s'.
	html break.
	(html textInput on: #lastname of: self) placeholder: chofer apellido.
	html break.
	html text: 'Correo electronico'.
	html break.
	(html textInput on: #mail of: self) placeholder: chofer email.
	html break.
	html text: 'Nueva contraseña'.
	html break.
	(html passwordInput on: #password of: self)
		placeholder: 'Nueva contraseña'.
	html break. html text: 'Telefono'.
	html break.
	(html textInput on: #telefono of: self) placeholder: chofer telefono
]

{ #category : #accessing }
ChoferEditorView >> telefono [
	^ telefono
]

{ #category : #accessing }
ChoferEditorView >> telefono: anObject [
	telefono := anObject
]
