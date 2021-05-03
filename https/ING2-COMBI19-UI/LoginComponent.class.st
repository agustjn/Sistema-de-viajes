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
	mail := anObject
]

{ #category : #'event processing' }
LoginComponent >> manejarLogin [
	(self model buscarUsuarioMail:mail Password:password)
		ifNotNil:[ :it | self procederCon: it ]. 
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
	| q |
	"Si el usuario existe en el sistema, se llama a este metodo para que se 
	recuerde la sesion del usuario y se renderize el componente Home"
	self session user: anUser.
	q := self session user.
	"self call: HomeComponente new."
]

{ #category : #rendering }
LoginComponent >> renderContentOn: aCanvas [
	aCanvas heading level:2; with: 'COMBI-19'.
	aCanvas form: [ self renderizarFormularioOn: aCanvas ].
	aCanvas div: [ self renderizarBotonesOn: aCanvas ]
]

{ #category : #rendering }
LoginComponent >> renderizarBotonesOn: aCanvas [
	aCanvas anchor 
					callback:[ self manejarLogin ] ;
					with: [aCanvas button:'Iniciar sesion'].
	aCanvas space.
	aCanvas anchor 
							callback:[ self manejarRegistro]	;
							with:[aCanvas button:'Registrarme!'].
									
]

{ #category : #rendering }
LoginComponent >> renderizarFormularioOn: aCanvas [
	aCanvas horizontalRule.
	aCanvas label:'Correo electronico'.
	aCanvas paragraph: [ aCanvas textInput on:#mail of:self ].
	aCanvas label: 'Contraseña'.
	aCanvas paragraph: [ aCanvas textInput on:#password of:self ].
]
