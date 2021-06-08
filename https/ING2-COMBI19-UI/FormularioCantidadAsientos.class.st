Class {
	#name : #FormularioCantidadAsientos,
	#superclass : #WAComponent,
	#instVars : [
		'cantidad',
		'ruta'
	],
	#category : #'ING2-COMBI19-UI-Viaje-CRUD-UI'
}

{ #category : #'as yet unclassified' }
FormularioCantidadAsientos class >> con: unaRuta [
	 ^ self new ruta: unaRuta
	
]

{ #category : #accessing }
FormularioCantidadAsientos >> cantAsientos [
	^ cantidad 
]

{ #category : #accessing }
FormularioCantidadAsientos >> cantAsientos: unaCantidad [
	cantidad := unaCantidad 
]

{ #category : #rendering }
FormularioCantidadAsientos >> renderContentOn: html [
	self renderFormulario: html 
]

{ #category : #rendering }
FormularioCantidadAsientos >> renderFormulario: html [
	html heading level3
		with: 'Ingrese la cantidad de asientos disponibles de la combi'.
	html
		text:
			'Aviso : La cantidad que se ve en la caja de texto es la capacidad maxima de la combi asignada';
		break.
	html break.
	(html textInput on: #cantAsientos of: self)
		placeholder: self ruta combi cantidadAsientos asString;
		size: 2.
	html horizontalRule
	"	html submitButton
		callback: [ self answer: self cantAsientos ];
		value: 'Guardar'.
	html space.
	html space.
	html submitButton
		callback: [ self answer: nil ];
		with: 'Cancelar'"
]

{ #category : #accessing }
FormularioCantidadAsientos >> ruta [
	^ruta
]

{ #category : #accessing }
FormularioCantidadAsientos >> ruta: unaRuta [
	ruta:= unaRuta
]
