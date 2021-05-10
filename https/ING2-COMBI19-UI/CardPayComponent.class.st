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
CardPayComponent >> renderContentOn: html [
	client agregarTarjeta: self card.
	html heading:'Ingrese los datos de su tarjeta de credito'.
	html break.
	html text:'Numero de tarjeta : '.
	html textInput on:#nro of:self card.
	html space.
	html text:'Codigo de seguridad: ' .
	(html textInput on:#codSeguridad of:self card)size:1.
	html break.
	html break.
	html text:'Fecha de vencimiento: '.
	html select 
			list:Date monthNames ;
			selected: self card mesVencimiento.
	html space.
	(html textInput on:#añoVencimiento of:self card) placeholder:'Año'.
	html break.
	html horizontalRule.
]
