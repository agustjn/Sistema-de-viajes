Class {
	#name : #CardPayComponent,
	#superclass : #WAComponent,
	#instVars : [
		'card',
		'parent',
		'client',
		'codSeguridad',
		'añoVencimiento',
		'mesVencimiento',
		'nro',
		'errorView'
	],
	#category : #'ING2-COMBI19-UI-ALL-UI'
}

{ #category : #'instance creation' }
CardPayComponent class >> newWithParent: aParent ofClient: aClient [
	^ self new 
					parent: aParent ; 
					card: TarjetaCredito new ;
					client: aClient ;
					yourself.
					
]

{ #category : #accessing }
CardPayComponent >> añoVencimiento [
	^ añoVencimiento
]

{ #category : #accessing }
CardPayComponent >> añoVencimiento: anObject [
	añoVencimiento := anObject
]

{ #category : #accessing }
CardPayComponent >> card [
	^ card
]

{ #category : #accessing }
CardPayComponent >> card: anObject [
	card := anObject
]

{ #category : #accessing }
CardPayComponent >> client [
	^ client
]

{ #category : #accessing }
CardPayComponent >> client: anObject [
	client := anObject
]

{ #category : #accessing }
CardPayComponent >> codSeguridad [
	^ codSeguridad
]

{ #category : #accessing }
CardPayComponent >> codSeguridad: anObject [
	codSeguridad := anObject
]

{ #category : #event }
CardPayComponent >> confirmarPago [
		( nro size = 16)
		ifFalse:[ self parent renderizarError:'El numero de su tarjeta debe ser de 16 digitos.'.
					 ^ self ].
	(  codSeguridad size = 3)
		ifFalse:[ self parent renderizarError:'El codigo de seguridad debe ser de 3 digitos.'.
					 ^ self ].
	( ( self fechaVencimiento subtractDate: Date today ) <= 31 ) "Si la fecha de vencimiento es el mismo mes de la fecha de pago, se rechaza"
		ifTrue:[ self parent renderizarError:'La fecha de vencimiento ingresada es invalida'.
					^ self].
		self parent activarMensajeExito.
		"self parent activarMensajeExito:'La reserva del viaje se hizo exitosamente'."
]

{ #category : #queries }
CardPayComponent >> fechaVencimiento [
	^ ( mesVencimiento,'/','1','/',añoVencimiento) asDate
]

{ #category : #accessing }
CardPayComponent >> mesVencimiento [
	^ mesVencimiento
]

{ #category : #accessing }
CardPayComponent >> mesVencimiento: anObject [
	mesVencimiento := anObject
]

{ #category : #accessing }
CardPayComponent >> nro [
	^ nro
]

{ #category : #accessing }
CardPayComponent >> nro: anObject [
	nro := anObject
]

{ #category : #accessing }
CardPayComponent >> parent [
	^ parent
]

{ #category : #accessing }
CardPayComponent >> parent: anObject [
	parent := anObject
]

{ #category : #rendering }
CardPayComponent >> renderContentOn: aCanvas [
	aCanvas render: errorView.
	aCanvas form:[	aCanvas div
			class: 'form-group col-6';
			with:[
			aCanvas label: 'Numero de tarjeta : '.
			aCanvas numberInput 
			placeholder:'Ingrese los 16 digitos de su tarjeta';
			class: 'form-control required ';
			on: #nro of: self].
		
	aCanvas div
			class: 'form-group col-1';
			with:[
			aCanvas label: 'Codigo de seguridad:  '.
			aCanvas passwordInput 
			class: 'form-control required ';
			placeholder:'123';
			on: #codSeguridad of: self].
		
		aCanvas div
			class: 'form-group col-4';
			with:[
			aCanvas label:'Fecha de vencimiento'.	
			aCanvas break.	
			(aCanvas select on:#mesVencimiento of:self	) list:Date monthNames .
			"aCanvas select 
			list: Date monthNames ; 
				selected:self mesVencimiento."
			aCanvas space.
			(aCanvas textInput 
			on:#añoVencimiento of:self) size:2].
	  self renderizarBotones: aCanvas.
		].

					  
		
			
			
	

]

{ #category : #rendering }
CardPayComponent >> renderizarBotones:html [
	html div
		class: 'text-center';
		with: [ html submitButton
				class: 'btn btn-dark';
				callback: [ self confirmarPago ];
				value: 'Confirmar pago'.
			html space.
			html submitButton
				class: 'btn btn-dark';
				callback: [ self answer ];
				value: 'Cancelar' ]
]

{ #category : #rendering }
CardPayComponent >> renderizarError: unString [
	errorView := GenericAdvertiseView
		newWithParent: self
		heading: 'Error en la validacion de la tarjeta'
		item1: unString
		item2: nil
		item3: nil
]
