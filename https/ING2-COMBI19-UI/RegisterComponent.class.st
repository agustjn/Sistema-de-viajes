Class {
	#name : #RegisterComponent,
	#superclass : #WAComponent,
	#instVars : [
		'nombre',
		'apellido',
		'mail',
		'dni',
		'contraseña',
		'fechaNac',
		'plan',
		'advertise'
	],
	#category : #'ING2-COMBI19-UI'
}

{ #category : #accessing }
RegisterComponent >> advertise [
	^ advertise
]

{ #category : #accessing }
RegisterComponent >> advertise: anObject [
	advertise := anObject
]

{ #category : #accessing }
RegisterComponent >> apellido [
	^ apellido
]

{ #category : #accessing }
RegisterComponent >> apellido: anObject [
	apellido := anObject
]

{ #category : #event }
RegisterComponent >> cancelar [
	self answer.
]

{ #category : #accessing }
RegisterComponent >> contraseña [
	^ contraseña
]

{ #category : #accessing }
RegisterComponent >> contraseña: anObject [
	contraseña := anObject
]

{ #category : #accessing }
RegisterComponent >> dni [
	^ dni
]

{ #category : #accessing }
RegisterComponent >> dni: anObject [
	dni := anObject
]

{ #category : #accessing }
RegisterComponent >> fechaNac [
	^ fechaNac
]

{ #category : #accessing }
RegisterComponent >> fechaNac: anObject [
	fechaNac := anObject
]

{ #category : #event }
RegisterComponent >> guardar: aCanvas [
	(self model
		validarRegistroConMail: mail
		Password: contraseña
		FechaNac: fechaNac printString)
		ifFalse: [ advertise := AdvertiseComponent new.
			mail := ''.
			contraseña := '' ]
]

{ #category : #accessing }
RegisterComponent >> mail [
	^ mail
]

{ #category : #accessing }
RegisterComponent >> mail: anObject [
	mail := anObject
]

{ #category : #queries }
RegisterComponent >> model [
	^ Combi19 soleInstance
	
]

{ #category : #accessing }
RegisterComponent >> nombre [
	^ nombre
]

{ #category : #accessing }
RegisterComponent >> nombre: anObject [
	nombre := anObject
]

{ #category : #accessing }
RegisterComponent >> plan [
	^ plan
]

{ #category : #accessing }
RegisterComponent >> plan: anObject [
	plan := anObject
]

{ #category : #rendering }
RegisterComponent >> renderContentOn: aCanvas [
	aCanvas heading level:1; with:'COMBI-19'.
	aCanvas heading level:2; with:'Registro'.
	aCanvas form:[	self renderizarNomApYMailOn: aCanvas.
						self renderizarDniContraseñaOn: aCanvas.
						self renderizarFechaNacimientoOn:aCanvas.
						self renderizarBotonesOn: aCanvas.
	].

	aCanvas render: advertise.



 
	
]

{ #category : #rendering }
RegisterComponent >> renderizarBotonesOn: aCanvas [
	aCanvas space.
	aCanvas submitButton
		callback: [ self guardar: aCanvas ];
		value: 'Confirmar'.
	aCanvas space.
	aCanvas submitButton on: #cancelar of: self
]

{ #category : #rendering }
RegisterComponent >> renderizarDniContraseñaOn: aCanvas [
	aCanvas text:'DNI:  '.
	aCanvas textInput on:#dni of: self.
	aCanvas break. aCanvas break.
	aCanvas text:'Contraseña:  '.
	aCanvas passwordInput on:#contraseña of: self.
	aCanvas break. aCanvas break.
	
	
]

{ #category : #rendering }
RegisterComponent >> renderizarFechaNacimientoOn: aCanvas [
	aCanvas text: 'Fecha de nacimiento: '.
	aCanvas dateInput on:#fechaNac of:self.
   aCanvas break. aCanvas break.
]

{ #category : #rendering }
RegisterComponent >> renderizarNomApYMailOn: aCanvas [
	aCanvas text:'Nombre: '.
	aCanvas textInput on:#nombre of:self.
	aCanvas space.
	aCanvas text:'Apellido: '.
	aCanvas textInput on:#apellido of:self.
	aCanvas break. aCanvas break.
	aCanvas text:'Correo electronico: '.
	aCanvas textInput on:#mail of:self.
	aCanvas break. aCanvas break.
]
