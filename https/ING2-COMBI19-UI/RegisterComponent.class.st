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
		'advertise',
		'tipoPlan',
		'cardPayView',
		'client'
	],
	#category : #'ING2-COMBI19-UI-ALL-UI'
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
		ifTrue: [ tipoPlan = #Basico
				ifTrue: [ self guardarClienteBasico ] 
				ifFalse: [  cardPayView isNotNil
											ifTrue:[ self guardarClienteGold ].	
								self renderizarPagoDeTarjeta.
								advertise := nil.
								cardPayView := CardPayComponent newWithParent:self ofClient:client.
							]      
					]

]

{ #category : #event }
RegisterComponent >> guardarClienteBasico [
	plan := PlanBasico new.
					self session
						user:
							(self model
								crearClienteConMail: mail
								contraseña: contraseña
								nombre: nombre
								apellido: apellido
								dni: dni
								fecha: fechaNac
								plan: plan).
								self call: HomeClientComponent new 
]

{ #category : #'as yet unclassified' }
RegisterComponent >> guardarClienteGold [
					client plan: PlanGold new.
					self session user: client.
					self call: HomeClientComponent new 
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
	aCanvas heading 
	level:1;
	class:'ml-5';
	style:'color: red';
	 with:'COMBI-19'.
	aCanvas break.
	aCanvas heading 
	level:2;
	
	style:'margin-left: 5%';
	 with:'Registro'.
	aCanvas div 
	class: 'container';
	with:[ 
		aCanvas div 
			class: 'row';
			with:
			[
			aCanvas div
				class: 'col-5';
				with: [ 
					
					aCanvas render: advertise.
					
					aCanvas form:
					 [ self renderizarNomApYMailOn: aCanvas.
						self renderizarDniContraseñaOn: aCanvas.
						self renderizarFechaNacimientoOn:aCanvas.
						self renderizarOpcionDePlan: aCanvas.
						aCanvas render: cardPayView.
						self renderizarBotonesOn: aCanvas.
						
	].



		].
	].
].

]

{ #category : #rendering }
RegisterComponent >> renderizarBotonesOn: aCanvas [
	aCanvas space.
	aCanvas submitButton
		class: 'btn btn-success mr-4';
		style:'background-color: blue';
		callback: [ self guardar: aCanvas ];
		value: 'Confirmar'.
	aCanvas space.
	
	aCanvas submitButton 
	class: 'btn btn-danger ml-4';
	on: #cancelar of: self
]

{ #category : #rendering }
RegisterComponent >> renderizarDniContraseñaOn: aCanvas [

	aCanvas div
			class: 'form-group col-12';
			with:[
			aCanvas label: 'DNI'.	
			aCanvas numberInput 
			placeholder:'12345678';
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
RegisterComponent >> renderizarFechaNacimientoOn: aCanvas [

aCanvas div
			class: 'form-group col-12';
			
			with:[
			aCanvas label: 'Fecha de nacimiento'.
			aCanvas break.	
			aCanvas dateInput 
			
			on: #fechaNac of: self.].
		
	
]

{ #category : #rendering }
RegisterComponent >> renderizarNomApYMailOn: aCanvas [
	aCanvas div
			class: 'form-group col-12 mx-0';
			with:[
			aCanvas label: 'Nombre'.	
			aCanvas textInput 
			placeholder:'Pedro';
			class: 'form-control required';
			on: #nombre of: self.].
	aCanvas div
			class: 'form-group col-12 mx-0';
			with:[	
			aCanvas label: 'Apellido'.	
			aCanvas textInput 
			placeholder:'Perez';
			class: 'form-control required';
			on: #apellido of: self.						
			].
		
		aCanvas div
			class: 'form-group col-12';
			with:[
			aCanvas label: 'Correo electronico'.	
			aCanvas textInput 
			placeholder:'pedro_perez@correo.com';
			class: 'form-control required';
			on: #mail of: self.].
	

	
	
]

{ #category : #rendering }
RegisterComponent >> renderizarOpcionDePlan: aCanvas [

	aCanvas div
			class: 'form-group col-5';
			with:[
			aCanvas label: 'Plan'.	
			aCanvas select 
			class: 'form-control required';
			list: #(#Basico #Gold ) ; 
				selected: tipoPlan ; 
				callback:[ :value | tipoPlan := value].
			].
		aCanvas break .
		aCanvas horizontalRule.
		 

	
	
]

{ #category : #event }
RegisterComponent >> renderizarPagoDeTarjeta [
		advertise := nil.
		client := (Cliente initializeCon: mail contraseña: contraseña nombre: nombre apellido: apellido dni: dni fecha: fechaNac plan: nil).
		cardPayView := CardPayComponent newWithParent:self ofClient: client.
]

{ #category : #updating }
RegisterComponent >> updateRoot: anHtmlRoot [ 
    super updateRoot: anHtmlRoot.
    anHtmlRoot stylesheet url: 'https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css'
]
