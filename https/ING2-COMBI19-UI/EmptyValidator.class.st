Class {
	#name : #EmptyValidator,
	#superclass : #Validator,
	#category : #'ING2-COMBI19-UI-Components'
}

{ #category : #validations }
EmptyValidator >> verificar: unString [
	"Ya que este no tiene ningun comportamiento en particular, retorna true y el padre es el que valida el vacio (class Validator)"

	^ true
]
