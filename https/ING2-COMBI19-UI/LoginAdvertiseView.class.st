Class {
	#name : #LoginAdvertiseView,
	#superclass : #WAComponent,
	#instVars : [
		'parent'
	],
	#category : #'ING2-COMBI19-UI-ALL-UI'
}

{ #category : #'instance creation' }
LoginAdvertiseView class >> newWithParent: aParent [
	| instance |
	instance := self new.
	instance parent: aParent.
	^ instance
	 
	"^ self new 
				parent: aParent ; 
				yourself"
]

{ #category : #accessing }
LoginAdvertiseView >> parent [
	^ parent
]

{ #category : #accessing }
LoginAdvertiseView >> parent: anObject [
	parent := anObject
]

{ #category : #rendering }
LoginAdvertiseView >> renderContentOn: html [
	html heading level2 with:' Intento de inicio de sesion incorrecto!'.
	html text:'Esto se pudo deber a cualquiera de las siguientes opciones: '.
	html unorderedList: [ html listItem:'Se ingreso un correo electronico incorrecto.'.
								html listItem:'Se ingreso un correo electronico correcto con contraseña invalida. ' ].
	html horizontalRule.
]
