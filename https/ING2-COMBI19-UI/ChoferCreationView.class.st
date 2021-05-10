Class {
	#name : #ChoferCreationView,
	#superclass : #WAComponent,
	#instVars : [
		'name',
		'lastname',
		'mail',
		'password',
		'cellphone',
		'parent',
		'advertiseView'
	],
	#category : #'ING2-COMBI19-UI-Chofer-UI'
}

{ #category : #'instance creation' }
ChoferCreationView class >> newWithParent: aParent [

	| instance |
	instance := self new.
	instance parent: aParent.
	^instance
]

{ #category : #accessing }
ChoferCreationView >> cellphone [
	^ cellphone
]

{ #category : #accessing }
ChoferCreationView >> cellphone: anObject [
	cellphone := anObject
]

{ #category : #event }
ChoferCreationView >> guardarChofer [
	(self model validarRegistroChoferConMail: mail Password: password)
		ifFalse:[ advertiseView := AdvertiseRegisterChofer new. ]
		ifTrue:[ self model crearChofer: name apellido: lastname email: mail contraseña: password telefono: cellphone. 
					self parent desactivarChoferCreationView  ]
	
]

{ #category : #accessing }
ChoferCreationView >> lastname [
	^ lastname
]

{ #category : #accessing }
ChoferCreationView >> lastname: anObject [
	lastname := anObject
]

{ #category : #accessing }
ChoferCreationView >> mail [
	^ mail
]

{ #category : #accessing }
ChoferCreationView >> mail: anObject [
	mail := anObject
]

{ #category : #accessing }
ChoferCreationView >> model [
	^Combi19 soleInstance
]

{ #category : #accessing }
ChoferCreationView >> name [
	^ name
]

{ #category : #accessing }
ChoferCreationView >> name: anObject [
	name := anObject
]

{ #category : #accessing }
ChoferCreationView >> parent [
	^ parent
]

{ #category : #accessing }
ChoferCreationView >> parent: anObject [
	parent := anObject
]

{ #category : #accessing }
ChoferCreationView >> password [
	^ password
]

{ #category : #accessing }
ChoferCreationView >> password: anObject [
	password := anObject
]

{ #category : #rendering }
ChoferCreationView >> renderContentOn: html [
	html heading level2 with:'Creacion de nuevo chofer'.
	html horizontalRule.
	html form:[ self renderizarFormularioOn: html.
					html break.
						html submitButton
							callback: [ self guardarChofer ];
							value: 'Guardar'.
					html space. 
					html space.
					html submitButton
								callback:[ self parent desactivarChoferCreationView ];
								with:'Cancelar' .
					].
	html render:advertiseView.
	

]

{ #category : #rendering }
ChoferCreationView >> renderizarFormularioOn: html [
	html text: 'Nombre'.
	html break.
	html textInput on: #name of: self.
	html break.
	html text: 'Apellido/s'.
	html break.
	html textInput on: #lastname of: self.
	html break.
	html text: 'Correo electronico'.
	html break.
	html textInput on: #mail of: self.
	html break.
	html text: 'Contraseña'.
	html break.
	html passwordInput on: #password of: self.
	html break.
	html text: 'Numero de telefono'.
	html break.
	html textInput on: #cellphone of: self.
	html break
]
