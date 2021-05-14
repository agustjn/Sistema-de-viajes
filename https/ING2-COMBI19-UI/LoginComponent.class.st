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
	(self model usuario: mail protegidoPor: password)
		ifNotNil: [ :it | self procederCon: it ]
	ifNil:[	self activarAdvertise.
	mail := nil.
	password := nil]
	

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
aCanvas div
class: 'ml-3';
	with:[
	aCanvas submitButton
		class:'btn btn-success';
		callback: [ self manejarLogin];
		value: 'Iniciar sesion'.
	aCanvas space.
	aCanvas submitButton
		class:'btn btn-primary';
		callback: [ self manejarRegistro ];
		with: 'Registrarme!'.
		]
]

{ #category : #rendering }
LoginComponent >> renderizarFormularioOn: aCanvas [

	aCanvas div
			class: 'form-group col-2';
			with:[
			aCanvas label: 'Correo electronico'.	
			aCanvas textInput 
			placeholder:'Pedro@correo.com';
			class: 'form-control required ml-4';
			on: #mail of: self.].
	
	aCanvas div
			class: 'form-group col-2';
			with:[
			aCanvas label: 'Contraseña'.
			aCanvas passwordInput 
			placeholder:'Ingrese su clave';
			class: 'form-control required ml-4';
			on: #password of: self.].
	
	
	
]

{ #category : #updating }
LoginComponent >> updateRoot: anHtmlRoot [ 
    super updateRoot: anHtmlRoot.
    anHtmlRoot stylesheet url: 'https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css'
]
