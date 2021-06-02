Class {
	#name : #EmptyValidator,
	#superclass : #Validator,
	#category : #'ING2-COMBI19-UI-Components'
}

{ #category : #validations }
EmptyValidator >> esValido: unString [
	"Si el string recibido esta vacio, retorno falso como informe de error en la validacion"
	unString = '' ifTrue:[ ^ false ]
]
