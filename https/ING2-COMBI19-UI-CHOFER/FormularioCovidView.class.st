Class {
	#name : #FormularioCovidView,
	#superclass : #WAComponent,
	#instVars : [
		'parent',
		'pasajero'
	],
	#category : #'ING2-COMBI19-UI-CHOFER-viajes-UI'
}

{ #category : #'instance creation' }
FormularioCovidView class >> newWith: unPasajero parent: aParent [
^ self new
		parent: aParent;
		pasajero: unPasajero;
		yourself
	
]

{ #category : #accessing }
FormularioCovidView >> parent [
	^parent
]

{ #category : #accessing }
FormularioCovidView >> parent: aParent [
	parent := aParent
]

{ #category : #accessing }
FormularioCovidView >> pasajero [
	^pasajero
]

{ #category : #accessing }
FormularioCovidView >> pasajero: unPasajero [
	pasajero:= unPasajero
]

{ #category : #accessing }
FormularioCovidView >> renderContentOn: html [
	self
		renderizarAviso: html .html
		form: [ self renderizarFormularioOn: html.
			self renderizarBotones: html ]
]

{ #category : #rendering }
FormularioCovidView >> renderizarFormularioOn:html [
	html div
		class: 'form-group col-2 ';
		with: [ html label: 'Ingrese su temperatura'.
			html textInput
				placeholder: '37';
				class: 'form-control required ml-4';
				on: #temperatura of: self ].
	html div
		class: 'form-group col-2 ';
		with: [ html label: '¿El pasajero tuvo fiebre en la ultima semana?'.
			html textInput
				placeholder: 'NO';
				class: 'form-control required ml-4';
				on: #temperatura of: self ].
		html div
		class: 'form-group col-2 ';
		with: [ html label: '¿ El pasajero tuvo perdida de gusto u olfato?'.
			html textInput
				placeholder: 'NO';
				class: 'form-control required ml-4';
				on: #temperatura of: self ].
			html div
		class: 'form-group col-2 ';
		with: [ html label: '¿EL pasajero tuvo dificultad respiratori?'.
			html textInput
				placeholder: 'NO';
				class: 'form-control required ml-4';
				on: #temperatura of: self ].
		html div
		class: 'form-group col-2 ';
		with: [ html label: '¿El pasajero tuvo dolor de garganta?'.
			html textInput
				placeholder: 'No';
				class: 'form-control required ml-4';
				on: #temperatura of: self ].
]
