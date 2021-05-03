Class {
	#name : #RegisterComponent,
	#superclass : #WAComponent,
	#instVars : [
		'nombre',
		'apellido',
		'mail',
		'dni',
		'contraseña',
		'dia',
		'mes',
		'año',
		'fechaNac'
	],
	#category : #'ING2-COMBI19-UI'
}

{ #category : #accessing }
RegisterComponent >> apellido [
	^ apellido
]

{ #category : #accessing }
RegisterComponent >> apellido: anObject [
	apellido := anObject
]

{ #category : #accessing }
RegisterComponent >> año [
	^ año
]

{ #category : #accessing }
RegisterComponent >> año: anObject [
	año := anObject
]

{ #category : #accessing }
RegisterComponent >> contraseña [
	^ contraseña
]

{ #category : #accessing }
RegisterComponent >> contraseña: anObject [
	contraseña := anObject
]

{ #category : #accessing }
RegisterComponent >> dia [
	^ dia
]

{ #category : #accessing }
RegisterComponent >> dia: anObject [
	dia := anObject
]

{ #category : #accessing }
RegisterComponent >> dni [
	^ dni
]

{ #category : #accessing }
RegisterComponent >> dni: anObject [
	dni := anObject
]

{ #category : #accessing }
RegisterComponent >> fechaNac [
	^ fechaNac
]

{ #category : #accessing }
RegisterComponent >> fechaNac: anObject [
	fechaNac := anObject
]

{ #category : #accessing }
RegisterComponent >> mail [
	^ mail
]

{ #category : #accessing }
RegisterComponent >> mail: anObject [
	mail := anObject
]

{ #category : #accessing }
RegisterComponent >> mes [
	^ mes
]

{ #category : #accessing }
RegisterComponent >> mes: anObject [
	mes := anObject
]

{ #category : #accessing }
RegisterComponent >> nombre [
	^ nombre
]

{ #category : #accessing }
RegisterComponent >> nombre: anObject [
	nombre := anObject
]

{ #category : #rendering }
RegisterComponent >> renderContentOn: aCanvas [
	aCanvas heading level:2; with:'COMBI-19'.
	aCanvas form:[	aCanvas text: 'Birthday: '.
   aCanvas dateInput
        callback: [ :value | self fechaNac: value ];
        with: self fechaNac.
   aCanvas break.
	aCanvas submitButton on:#save of: self.
	].

	aCanvas anchor 
			callback:[self inform:self fechaNac printString
						.
						self halt]; 
				with: 'STOP'.
 
	
]

{ #category : #event }
RegisterComponent >> save [ 
	 self inform: '--' , self fechaNac printString.
	 self answer.
	 self halt.
]
