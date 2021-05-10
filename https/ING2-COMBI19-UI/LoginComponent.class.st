Class {
	#name : #LoginComponent,
	#superclass : #WAComponent,
	#instVars : [
		'mail',
		'password',
		'advertiseView'
	],
	#category : #'ING2-COMBI19-UI-ALL-UI'
}

{ #category : #'event processing' }
LoginComponent >> activarAdvertise [
	advertiseView := (LoginAdvertiseView new).
]

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
	self halt.
	(self model usuario: mail protegidoPor: password)
		ifNotNil: [ :it | self procederCon: it ].
	self activarAdvertise.
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
	aCanvas render:advertiseView. 
	aCanvas
		form: [ self renderizarFormularioOn: aCanvas.
			self renderizarBotonesOn: aCanvas ].
	
]

{ #category : #rendering }
LoginComponent >> renderizarBotonesOn: aCanvas [
	aCanvas submitButton
		callback: [ self manejarLogin];
		value: 'Iniciar sesion'.
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
	aCanvas passwordInput on: #password of: self.
	aCanvas break.
	aCanvas break
]
