Class {
	#name : #EditorComponent,
	#superclass : #WAComponent,
	#instVars : [
		'user',
		'name',
		'lastname',
		'mail',
		'password'
	],
	#category : #'ING2-COMBI19-UI-Admin-UI'
}

{ #category : #accessing }
EditorComponent >> lastname [
	^ lastname
]

{ #category : #accessing }
EditorComponent >> lastname: anObject [
	lastname := anObject
]

{ #category : #accessing }
EditorComponent >> mail [
	^ mail
]

{ #category : #accessing }
EditorComponent >> mail: anObject [
	mail := anObject
]

{ #category : #accessing }
EditorComponent >> name [
	^ name
]

{ #category : #accessing }
EditorComponent >> name: anObject [
	name := anObject
]

{ #category : #accessing }
EditorComponent >> password [
	^ password
]

{ #category : #accessing }
EditorComponent >> password: anObject [
	password := anObject
]

{ #category : #rendering }
EditorComponent >> renderizarAdvertencia: html [
	html div: [ html heading level2 with:'Aviso'.
					html text: 'Los campos que no se quieran modificar, se deben dejar vacios.' ]
]

{ #category : #rendering }
EditorComponent >> renderizarCamposBasicosOn: html [
	html horizontalRule.
	html heading: 'Editar datos'.	
	self renderizarAdvertencia: html.
	self renderizarCamposOn: html.
	
]

{ #category : #rendering }
EditorComponent >> renderizarCamposOn: html [
	html
		form: [ 
			html space.
			html break.
			html text:'Nombre'.
			html break.
			(html textInput on: #name of: self) placeholder: user nombre.
			html break.
			html text:'Apellido/s'.
			html break.
			(html textInput on: #lastname of: self)placeholder: user apellido.
			html break.
			html text:'Correo electronico'.
			html break.
			 (html textInput on:#mail of:self) placeholder: user email.
			html break.
			html text:'Nueva contraseña'.
			html break.
			 (html textInput on:#password of:self) placeholder:'Nueva contraseña'.
			html break.
				 ]
]

{ #category : #accessing }
EditorComponent >> user [
	^ user
]

{ #category : #accessing }
EditorComponent >> user: anObject [
	user := anObject
]
