Class {
	#name : #ModificarCuentaView,
	#superclass : #WAComponent,
	#instVars : [
		'parent',
		'nombre',
		'apellido',
		'mail',
		'dni',
		'contraseña',
		'fechaNac',
		'advertiseView'
	],
	#category : #'ING2-COMBI19-UI-CLIENTE-Principales-UI'
}

{ #category : #'instance creation' }
ModificarCuentaView class >> newWithParent: aParent [
	^ self new parent: aParent
	
]

{ #category : #accessing }
ModificarCuentaView >> apellido [
	^ apellido
]

{ #category : #accessing }
ModificarCuentaView >> apellido: anObject [
	apellido := anObject
]

{ #category : #event }
ModificarCuentaView >> cancelar [
	self parent desactivarModificarDatosView
]

{ #category : #accessing }
ModificarCuentaView >> contraseña [
	^ contraseña
]

{ #category : #accessing }
ModificarCuentaView >> contraseña: anObject [
	contraseña := anObject
]

{ #category : #accessing }
ModificarCuentaView >> dni [
	^ dni
]

{ #category : #accessing }
ModificarCuentaView >> dni: anObject [
	dni := anObject
]

{ #category : #accessing }
ModificarCuentaView >> fechaNac [
	^ fechaNac
]

{ #category : #accessing }
ModificarCuentaView >> fechaNac: anObject [
	fechaNac := anObject
]

{ #category : #event }
ModificarCuentaView >> guardar [
	| auxAccount valorRetornado |
	"Se tuvo que crear esta variable auxiliar porque sino no funciona"
	auxAccount := self userAccount.
	valorRetornado := auxAccount
		modificarConMail: mail
		Nombre: nombre
		Apellido: apellido
		Dni: dni
		Contraseña: contraseña
		FechaNacimiento: fechaNac.

	valorRetornado isString
		ifTrue: [ self renderizarErrorDe: valorRetornado ]
		ifFalse: [ 
			self parent
		activarMensajeExito: 'Los datos de su cuenta se modificaron exitosamente!' ].
	
]

{ #category : #accessing }
ModificarCuentaView >> mail [
	^ mail
]

{ #category : #accessing }
ModificarCuentaView >> mail: anObject [
	mail := anObject
]

{ #category : #accessing }
ModificarCuentaView >> nombre [
	^ nombre
]

{ #category : #accessing }
ModificarCuentaView >> nombre: anObject [
	nombre := anObject
]

{ #category : #accessing }
ModificarCuentaView >> parent [
	^ parent
]

{ #category : #accessing }
ModificarCuentaView >> parent: anObject [
	parent := anObject
]

{ #category : #rendering }
ModificarCuentaView >> renderContentOn: html [
	html space ; space.
	html strong:'Aviso'.
	html break ; space.
	html label:'Los datos que no se deseen modificar, se deben dejar vacios.'.
	html break ; break.
	html render:advertiseView ; break ; break.
	html form:[html div 
				class:'container';
				with:[ self renderizarNomYApYMail: html.
						self renderizarDniContraseñaOn: html.
						self renderizarFechaNacimientoOn: html.
						self renderizarBotonesOn: html.
						html break ; break.
						   ] ].
   
]

{ #category : #rendering }
ModificarCuentaView >> renderizarBotonesOn: aCanvas [
	aCanvas space.
	aCanvas submitButton
		class: 'btn btn-success mr-4';
		style:'background-color: blue';
		callback: [ self guardar ];
		with:'Confirmar'.
	aCanvas space.
	
	aCanvas submitButton 
	class: 'btn btn-danger ml-4';
	on: #cancelar of: self
]

{ #category : #rendering }
ModificarCuentaView >> renderizarDniContraseñaOn: aCanvas [

	aCanvas div
			class: 'form-group col-12';
			with:[
			aCanvas label: 'DNI'.	
			aCanvas numberInput 
			placeholder:self userAccount dni;
			class: 'form-control required ';
			on: #dni of: self.].

aCanvas div
			class: 'form-group col-12';
			with:[
			aCanvas label: 'Contraseña'.	
			aCanvas passwordInput 
			class: 'form-control required ';
			on: #contraseña of: self.].

]

{ #category : #rendering }
ModificarCuentaView >> renderizarErrorDe: stringRetornado [
	| errorStr |
	stringRetornado = 'errorEnMail'
		ifTrue:[errorStr := 'El correo ingresado ya existe en el sistema'].
	stringRetornado = 'errorEnContraseña'
		ifTrue:[errorStr := 'La contraseña ingresada no supera los 5 caracteres'].
	stringRetornado = 'errorEnFechaNacimiento'
		ifTrue:[errorStr := 'Su edad debe superar los 18 años'].
	advertiseView := GenericAdvertiseView newWithParent: self heading:'Error en la validacion de datos'  
							item1:errorStr item2:nil  item3:nil.
		
	
]

{ #category : #rendering }
ModificarCuentaView >> renderizarFechaNacimientoOn: aCanvas [

aCanvas div
			class: 'form-group col-12';
			
			with:[
			aCanvas label: 'Fecha de nacimiento'.
			aCanvas break.	
			aCanvas dateInput on: #fechaNac of: self].
]

{ #category : #rendering }
ModificarCuentaView >> renderizarNomYApYMail: aCanvas [
	aCanvas div
			class: 'row';
			with:[
				aCanvas div
					class: 'form-group col ml-3';
					with:[
					aCanvas label: 'Nombre'.	
					aCanvas textInput 
					placeholder:self userAccount nombre ;
					class: 'form-control required';
					on: #nombre of: self.].
				aCanvas div
					class: 'form-group col ml-3';
					with:[	
					aCanvas label: 'Apellido'.	
					aCanvas textInput 
					placeholder:self userAccount apellido;
					class: 'form-control required';
					on: #apellido of: self.						
					].
			].
		aCanvas div
			class: 'form-group col-12';
			with:[
			aCanvas label: 'Correo electronico'.	
			aCanvas textInput 
			placeholder:self userAccount email;
			class: 'form-control required';
			on: #mail of: self.].
	
]

{ #category : #queries }
ModificarCuentaView >> userAccount [
	^ self session user
]
