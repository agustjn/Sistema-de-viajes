Class {
	#name : #TarjetaCredito,
	#superclass : #Object,
	#instVars : [
		'nro',
		'codSeguridad',
		'añoVencimiento',
		'mesVencimiento'
	],
	#category : #'ING2-COMBI19-Modelo'
}

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
