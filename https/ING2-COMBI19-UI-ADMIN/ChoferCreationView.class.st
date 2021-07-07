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
	#category : #'ING2-COMBI19-UI-ADMIN-Chofer-CRUD-UI'
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
		ifFalse: [ advertiseView := AdvertiseRegisterChofer new ]
		ifTrue: [ self model
				crearChofer: name
				apellido: lastname
				email: mail
				contraseña: password
				telefono: cellphone.
			self parent desactivarChoferCreationView ]
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
ChoferCreationView >> renderContentOn: aCanvas [
	aCanvas heading level4 with:'Creacion de nuevo chofer'.
	aCanvas horizontalRule.
	aCanvas form:[ self renderizarFormularioOn: aCanvas.
					aCanvas break.
						aCanvas submitButton
							class:'btn btn-success';
							callback: [ self guardarChofer ];
							value: 'Guardar'.
					aCanvas space. 
					aCanvas space.
					aCanvas submitButton
								class:'btn btn-danger';
								callback:[ self parent desactivarChoferCreationView ];
								with:'Cancelar' .
					].
	aCanvas render:advertiseView.
	

]

{ #category : #rendering }
ChoferCreationView >> renderizarFormularioOn: aCanvas [
	aCanvas div
			class: 'form-group col-5';
			with:[
			aCanvas label: 'Nombre'.	
			aCanvas textInput 
			placeholder:'Pedro';
			class: 'form-control required ml-4';
			on: #name of: self.].
		aCanvas div
			class: 'form-group col-5';
			with:[
			aCanvas label: 'Apellido/s'.	
			aCanvas textInput 
			placeholder:'Perez';
			class: 'form-control required ml-4';
			on: #lastname of: self.].
	
	aCanvas div
			class: 'form-group col-5';
			with:[
			aCanvas label: 'Correo Electronico'.	
			aCanvas textInput 
			placeholder:'pperez@correo.com';
			class: 'form-control required ml-4';
			on: #mail of: self.].
	aCanvas div
			class: 'form-group col-4';
			with:[
			aCanvas label: 'Contraseña'.	
			aCanvas passwordInput 
			placeholder:'Contraseña';
			class: 'form-control required ml-4';
			on: #password of: self.].
	aCanvas div
			class: 'form-group col-4';
			with:[
			aCanvas label: 'Telefono'.	
			aCanvas numberInput 
			placeholder:'221 111 2222';
			class: 'form-control required ml-4';
			on: #cellphone of: self.].
	
]

{ #category : #updating }
ChoferCreationView >> updateRoot: anHtmlRoot [ 
    super updateRoot: anHtmlRoot.
    anHtmlRoot stylesheet url: 'https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css'
]
