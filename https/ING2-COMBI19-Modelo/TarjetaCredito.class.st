Class {
	#name : #TarjetaCredito,
	#superclass : #Object,
	#instVars : [
		'nro',
		'codSeguridad',
		'mesVencimiento',
		'añoVencimiento'
	],
	#category : #'ING2-COMBI19-Modelo'
}

{ #category : #'instance creation' }
TarjetaCredito class >> conNumero: aNumbers mesVencimiento:aMonth añoVencimiento:aYear codSeguridad: aCode [
	(aMonth,'/15/',aYear) asDate < Date today "Concateno el dia 15 con el mes y año ingresado para poder interpretarlo como Fecha"
		ifTrue: [ ^ 'errorEnFechaVencimiento' ].	"Si la fecha ingresada es inferior a la fecha de ahora, corta ejecucion y devuelve el error"
	aNumbers size = 16
		ifFalse: [ ^ 'errorEnNumeroDeTarjeta' ].	"Si la cantidad de numeros ingresados es distinta de 16, corta ejecucion y devuelve el error"
	aCode size = 3
		ifFalse: [ ^ 'errorEnCodSeguridad' ].	"Si la cantidad de caracteres es mayor/inferior a 3, corta ejecucion y devuelve el error"
	^ self new "Si no corto la ejecucion, retorno instancia inicializada"
		nro: aNumbers;
		mesVencimiento: aMonth;
		añoVencimiento: aYear;
		codSeguridad: aCode;
		yourself
]

{ #category : #accessing }
TarjetaCredito >> añoVencimiento [
	^ añoVencimiento
]

{ #category : #accessing }
TarjetaCredito >> añoVencimiento: anObject [
	añoVencimiento := anObject
]

{ #category : #accessing }
TarjetaCredito >> codSeguridad [
	^ codSeguridad
]

{ #category : #accessing }
TarjetaCredito >> codSeguridad: anObject [
	codSeguridad := anObject
]

{ #category : #accessing }
TarjetaCredito >> mesVencimiento [
	^ mesVencimiento
]

{ #category : #accessing }
TarjetaCredito >> mesVencimiento: anObject [
	mesVencimiento := anObject
]

{ #category : #accessing }
TarjetaCredito >> nro [
	^ nro
]

{ #category : #accessing }
TarjetaCredito >> nro: anObject [
	nro := anObject
]
