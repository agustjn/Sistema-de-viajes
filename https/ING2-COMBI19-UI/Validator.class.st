Class {
	#name : #Validator,
	#superclass : #Object,
	#category : #'ING2-COMBI19-UI-Components'
}

{ #category : #validations }
Validator >> esValido: unString [
	"Este es el metodo en comun que va a haber entre las clases, cada una implementa el verificar: a su propia manera"
	^ (self verificar: unString) & (self validarVacio: unString)
]

{ #category : #validations }
Validator >> validarVacio: unString [
	unString ifEmpty: [ ^ false ].
	^ true
]

{ #category : #validations }
Validator >> verificar: unString [
	self subclassResponsibility 
]
