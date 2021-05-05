Class {
	#name : #LoginComponent,
	#superclass : #WAComponent,
	#instVars : [
		'mail',
		'password'
	],
	#category : #'ING2-COMBI19-UI'
}

{ #category : #accessing }
LoginComponent >> mail [
	^ mail
]

{ #category : #accessing }
LoginComponent >> mail: anObject [
	mail := anObject.
]

{ #category : #'event processing' }
LoginComponent >> manejarLogin [
	(self model usuario: mail protegidoPor: password)
		ifNotNil: [ :it | self procederCon: it ].
	mail := nil.
	password := nil
]

{ #category : #'event processing' }
LoginComponent >> manejarRegistro [
	self call: RegisterComponent new.
]

{ #category : #rendering }
LoginComponent >> model [
	^ Combi19 soleInstance
]

{ #category : #accessing }
LoginComponent >> password [
	^ password
]

{ #category : #accessing }
LoginComponent >> password: anObject [
	password := anObject
]

{ #category : #'event processing' }
LoginComponent >> procederCon: anUser [
	"Si el usuario existe en el sistema, se llama a este metodo para que se 
	recuerde la sesion del usuario y se renderize el componente Home"
	self session user: anUser.
	(Administrador allInstances includes: anUser)
		ifTrue: [ self call: HomeAdminComponent new ].
	(Chofer allInstances includes: anUser)
		ifTrue: [ self call: HomeChoferComponent new ].
	(Cliente allInstances includes: anUser)
		ifTrue: [ self call: HomeClientComponent new ]
]

{ #category : #rendering }
LoginComponent >> renderContentOn: aCanvas [
	aCanvas heading
		level: 2;
		with: 'COMBI-19'.
	aCanvas horizontalRule.
	aCanvas
		form: [ self renderizarFormularioOn: aCanvas.
			self renderizarBotonesOn: aCanvas ]
]

{ #category : #rendering }
LoginComponent >> renderizarBotonesOn: aCanvas [
	aCanvas submitButton
		callback: [ self manejarLogin ];
		with: 'Iniciar sesion'.
	aCanvas space.
	aCanvas submitButton
		callback: [ self manejarRegistro ];
		with: 'Registrarme!'.
]

{ #category : #rendering }
LoginComponent >> renderizarFormularioOn: aCanvas [
	aCanvas label: 'Correo electronico'.
	aCanvas break.
	aCanvas break.
	aCanvas textInput on: #mail of: self.
	aCanvas break.
	aCanvas break.
	aCanvas label: 'Contraseña'.
	aCanvas break.
	aCanvas break.
	aCanvas textInput on: #password of: self.
	aCanvas break.
	aCanvas break
]
