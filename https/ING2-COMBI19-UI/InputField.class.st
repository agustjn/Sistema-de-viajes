Class {
	#name : #InputField,
	#superclass : #Object,
	#instVars : [
		'content',
		'validationStrategy'
	],
	#category : #'ING2-COMBI19-UI-Components'
}

{ #category : #initialization }
InputField class >> newWithStrategy: validatorInstance [
	^ self new validationStrategy: validatorInstance.
]

{ #category : #accessing }
InputField >> content [
	^ content
]

{ #category : #accessing }
InputField >> content: anObject [
	content := anObject
]

{ #category : #queries }
InputField >> esValido [
	"Se le envia un mensaje a la instancia que contenga de Validator con el contenido del string para que lo verifique"
	validationStrategy esValido: content
]

{ #category : #accessing }
InputField >> validationStrategy: anObject [
	"Siempre se le va a setear una forma de validacion en la creacion de una instancia, enviando el mensaje de clase (mirar Class side)"
	validationStrategy := anObject
]
