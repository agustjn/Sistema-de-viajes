Class {
	#name : #CardPayComponent,
	#superclass : #WAComponent,
	#instVars : [
		'card',
		'parent',
		'client'
	],
	#category : #'ING2-COMBI19-UI-ALL-UI'
}

{ #category : #deprecated }
CardPayComponent class >> newWithParent: aParent [
	^ self new 
					parent: aParent ; 
					card: TarjetaCredito new ;
					yourself.
					
]

{ #category : #'instance creation' }
CardPayComponent class >> newWithParent: aParent ofClient: aClient [
	^ self new 
					parent: aParent ; 
					card: TarjetaCredito new ;
					client: aClient ;
					yourself.
					
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
CardPayComponent >> parent [
	^ parent
]

{ #category : #accessing }
CardPayComponent >> parent: anObject [
	parent := anObject
]

{ #category : #rendering }
CardPayComponent >> renderContentOn: aCanvas [
	client agregarTarjeta: self card.
	
	aCanvas div
			class: 'form-group col-12';
			with:[
			aCanvas label: 'Numero de tarjeta : '.
			aCanvas numberInput 
			placeholder:'Ingrese los 16 digitos de su tarjeta';
			class: 'form-control required ';
			on: #nro of: self card].
		
	aCanvas div
			class: 'form-group col-4';
			with:[
			aCanvas label: 'Codigo de seguridad:  '.
			aCanvas passwordInput 
			class: 'form-control required ';
			placeholder:'123';
			on: #codSeguridad of: self card].
		
		aCanvas div
			class: 'form-group row';
			with:[
			aCanvas label:'Fecha de vencimiento'
.				
			aCanvas select 
			class: 'form-control ml-3 col-3 required';
			list: Date monthNames ; 
				selected:self card mesVencimiento.
			aCanvas numberInput 
			placeholder: '2021';
			class: 'form-control col-2 ml-2 required ';
			on:#añoVencimiento of:self card].
					  
		
			
			
	

]
